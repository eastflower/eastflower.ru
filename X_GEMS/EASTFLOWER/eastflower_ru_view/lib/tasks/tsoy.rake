# require_relative './common/connection'

require 'open-uri'
require 'nokogiri'

namespace :tsoy do
  # time bin/rake tsoy:migrate
  task migrate: :environment do
    Rake::Task["db:bootstrap"].invoke
    Rake::Task["tsoy:create_root"].invoke
    Rake::Task["tsoy:migrate_hubs"].invoke
    Rake::Task["tsoy:migrate_posts"].invoke
    Rake::Task["tsoy:fill_hubs_by_tags"].invoke
  end

  task create_root: :environment do
    user = User.new(
      email:    'admin@eastflower.ru',
      login:    'admin',
      username: 'Елена Цой',
      password: 'qwerty123',
      password_confirmation: 'qwerty123'
    )

    user.skip_confirmation!
    user.save!
    User.first.confirm!
  end

  task migrate_hubs: :environment do
    user = User.first

    hubs_list = {
      'Несладкие блюда' => [
        'Салаты и закуски',
        'Соусы',
        'Супы',
        'Вторые блюда',
        'Молочные блюда'
      ],

      'Несладкая выпечка' => [
        'Хлеб',
        'Другая несладкая выпечка'
      ],

      'Торты и пирожные' => [
        'Торты',
        'Пирожные'
      ],

      'Тарт и тарталетки' => [],

      'Сладкая выпечка' => [],

      'Пироги и запеканки' => [
        'Галеты'
      ],

      'Кексы и маффины' => [
        'Пряные кексы',
        'Капкейки',
        'Банановые кексы и маффины'
      ],

      'Печенье' => [
        'Овсяное печенье',
        'Разное печенье',
        'Мадлен'
      ],

      'Новогодняя выпечка' => [
        'Пряники',
        'Пряничные домики',
        'Елки',
        'Новогоднее печенье',
        'Штоллены',
        'Новогодние полена'
      ],

      'Постная выпечка' => [],
      'Десерты и конфеты' => []
    }

    main_hub = user.hubs.create(title: 'Главная лента', slug: :main, state: :published)
    hub_2 = user.hubs.create(title: 'Рецепты', slug: :recipes, state: :published)
    hub_3 = user.hubs.create(title: 'Статьи', slug: :posts, state: :published)
    hub_4 = user.hubs.create(title: 'Страницы', slug: :pages, state: :published)

    user.posts.create(title: 'О Блоге', slug: 'about', state: :published)

    hubs_list.each_pair do |hub_title, subs|
      hub = user.hubs.create(title: hub_title, state: :published)
      hub.move_to_child_of(hub_2)
      puts "#{ hub.title } => #{ hub.slug }"

      subs.each do |hub_title|
        sub_hub = user.hubs.create(title: hub_title, state: :published)
        puts "SUB: >>> #{ sub_hub.title } => #{ sub_hub.slug }"
        sub_hub.move_to_child_of(hub)
      end
    end
  end

  # bin/rake tsoy:dump_posts_to_yaml
  task dump_posts_to_yaml: :environment do
    user = User.first
    main_hub = Hub.friendly_first(:main)

    root = AppViewEngine::Engine.root
    urls = File.open("#{ root }/posts_data/urls.txt").read.split("\n").reverse

    urls_size = urls.size

    urls.each_with_index do |url, index|
      puts url
      puts "#{index}/#{urls_size}"

      content = open(url).read
      doc = Nokogiri::HTML(content)

      # get title
      title  = doc.css('.j-e-title a').try(:first).try(:text)

      # get images
      images = doc.css('.j-e-text img:not(.i-ljuser-userhead)').map{|x| x['src']}

      # get tags
      tags = doc.css('.j-e-tags-item a').map(&:text)

      # get data
      data = doc.css('.j-e-date-day').try(:first).try(:text)

      # get time
      time = doc.css('.j-e-date-time').try(:first).try(:text)

      # get comments
      comments = []

      doc.css('#comments article').each do |comment|
        comments << {
          date:    comment.css('.j-c-date-day').try(:first).try(:text),
          time:    comment.css('.j-c-date-time').try(:first).try(:text),
          login:   comment.css('.i-ljuser-username').try(:first).try(:text),
          comment: comment.css('.j-c-text').try(:first).try(:text)
        }
      end

      # get intro/content
      intro   = ""
      content = ""

      doc = Nokogiri::HTML( doc.css('.j-e-text').first.inner_html )
      doc.css('.lj-like').remove
      post_content =  doc.css('body').inner_html

      if (content = post_content.split('<a name="cutid1"></a>')).size == 2
        intro   = content.first
        content = content.last
      else
        content = content.first
      end

      post = {
        title:    title,
        data:     data,
        time:     time,
        intro:    intro,
        content:  content,
        comments: comments,
        tags:     tags,
        images:   images
      }.to_yaml

      file_name = [data.to_time.strftime("%Y-%m-%d"), title].join(' -- ')

      output = File.open("#{ root }/posts_data/texts/#{ file_name }", "w")
      output << post
      output.close
    end
  end

  # bin/rake tsoy:migrate_posts
  task migrate_posts: :environment do
    user     = User.first
    main_hub = Hub.friendly_first(:main)

    Post.delete_all
    PubTag.delete_all
    PubCategoryRel.delete_all

    root  = AppViewEngine::Engine.root
    files = Dir["#{ root }/posts_data/texts/*"]
    files_size = files.size

    files.each_with_index do |file_path, index|
      content = File.read(file_path)
      _post   = YAML.load(content)

      # puts post[:title]
      # puts (post[:data] + ' ' + post[:time]).try(:to_time)
      # puts post[:intro]
      # puts post[:content]
      # puts post[:comments]
      # puts post[:tags]
      # puts post[:images]

      _data = (_post[:data] + ' ' + _post[:time]).try(:to_time)

      post = Post.new(
        user:        user,
        title:       _post[:title],
        raw_intro:   _post[:intro],
        raw_content: _post[:content],
        state:       :published,

        created_at:   _data,
        updated_at:   _data,
        published_at: _data
      )
      post.content_processing_for(user)
      post.save!

      PubCategoryRel.create(category: main_hub, item: post)

      # TAGS
      _post[:tags].each do |_tag|
        tag = PubTag.where(title: _tag).first || PubTag.create(user: user, title: _tag, state: :published)
        pcr = PubCategoryRel.new(category: tag, item: post)

        if pcr.save
          # puts "OK #{ post.title } => #{ _tag }"
        else
          # puts "FALED #{ post.title } => #{ _tag } => #{ pcr.errors.to_a }"
        end
      end

      # COMMENTS
      _post[:comments].each do |_comment|
        _data = "#{ _comment[:date] } #{ _comment[:time] }".try(:to_time)
        cuser = (_comment[:login].to_s.match /eastflower/) ? user : nil

        comment = post.comments.new(
          user:        cuser,
          title:       _comment[:login],
          raw_content: _comment[:comment]
        )
        comment.created_at = _data
        if comment.save
          # ok!
          comment.to_published
        else
          puts _comment
        end
      end # comments

      # IMAGES

      if (images = _post[:images]).present?
        images.each do |image_url|
          begin
            puts image_url
            extname  = File.extname(image_url)
            basename = File.basename(image_url, extname)

            file = Tempfile.new([basename, extname])
            file.binmode

            open(URI.parse(image_url)) do |data|
              file.write data.read
            end

            file.rewind

            img = post.attached_images.new(user: user, file: file)

            if img.save
              puts img.file.url
            else
              puts img.errors.to_a
            end
          rescue Exception => e
            puts e
          end
        end # each
      end # images

      # UPDATE RELATIONS
      post.keep_consistency!

      puts "#{ index }/#{ files_size } #{ post.title } ==> POST DONE"
    end

    # Post.all.each{|x| x.keep_consistency! }
  end

  # bin/rake tsoy:fill_hubs_by_tags
  task fill_hubs_by_tags: :environment do
    hubs_tags = {
      'Несладкие блюда' => ['салат', 'соус', 'суп', 'мясо', 'творог', 'молоко', 'йогурт'],
      'Салаты и закуски' => ['салат'],
      'Соусы' => ['соус'],
      'Супы' => ['суп'],
      'Вторые блюда' => ['мясо'],
      'Молочные блюда' => ['творог','молоко','йогурт'],

      'Несладкая выпечка' => ['хлеб', 'крекер', 'печенье', 'овсяное печенье'],
      'Хлеб' => ['хлеб'],
      'Другая несладкая выпечка' => ['крекер','печенье', 'овсяное печенье'],

      'Торты и пирожные' => ['торт','торт на заказ','торт Эстрехази','торты'],
      'Торты' => ['торт','торт на заказ', 'торт Эстрехази', 'торты'],
      'Пирожные' =>['пирожное', 'пирожные', 'заварные пирожные'],

      'Тарт и тарталетки' => ['тарт', 'тарталетки'],

      'Сладкая выпечка' => ['оладьи', 'пирог', 'дрожжевое тесто'],

      'Пироги и запеканки' => ['пирог','творожная запеканка'],
      'Галеты' => ['галета'],

      'Кексы и маффины' => ['кекс', 'кекс. шоколад', 'кексы', 'мраморный кекс'],
      'Пряные кексы' => ['пряничные специи','пряничный хлеб','пряничная смесь'],
      'Капкейки' => ['капкейки','карамельные капкейки','клубничные капкейки','крем для капкейков'],
      'Банановые кексы и маффины' => ['маффины', 'маффины. йогурт', 'банан', 'банановая выпечка', 'банановые рецепты', 'банановый кекс', 'бананы'],

      'Печенье' => ['печенье', 'песочное печенье', 'овсяное печенье', 'имбирное печенье', 'мадлен'],
      'Овсяное печенье' => ['овсяное печенье'],
      'Разное печенье' => ['имбирное печенье'],
      'Мадлен' => ['мадлен'],

      'Новогодняя выпечка' => ['Пряник','Пряники имбирные','пряники', 'шаблон домика', 'пряничный домик', 'елка', 'пряничная елка', 'новогодняя выпечка', 'Штоллен', 'новогоднее полено'],
      'Пряники'  => ['Пряник', 'Пряники', 'имбирные пряники'],
      'Пряничные домики'  => ['шаблон домика','пряничный домик'],
      'Елки'  => ['елка','пряничная елка'],
      'Новогоднее печенье'  => ['новогодняя выпечка'],
      'Штоллены'  => ['Штоллен'],
      'Новогодние полена'  => ['новогоднее полено'],

      'Постная выпечка' => ['постная выпечка', 'постное меню'],

      'Десерты и конфеты' => ['макарон', 'макаронс']
    }

    hubs_tags.each_pair do |hub_title, tags|
      puts hub_title

      hub   = Hub.friendly_first(hub_title.to_slug_param)

      tags.each do |tag|
        puts tag

        if tag = PubTag.friendly_first(tag.to_slug_param)
          posts = tag.posts

          posts.each do |post|
            PubCategoryRel.create(category: hub, item: post)
            post.keep_consistency!
            print '.'
          end
        else
          puts "NOT FOUND: #{ tag }"
        end
      end

      puts

    end
  end

end

# tags.each do |tag|
#   tag = PubTag.friendly_first(tag)
# end

# hub = Hub.friendly_first("Десерты и конфеты".to_slug_param)

# pcr = PubCategoryRel.new(category: hub, item: tag)

# puts ">>> #{ tags.join(', ') }"
# tag = PubTag.where(title: _tag).first || PubTag.create(user: user, title: _tag, state: :published)
# pcr = PubCategoryRel.new(category: tag, item: post)

# task migrate_posts: :environment do
#   user = User.first
#   main_hub = Hub.last

#   root = AppViewEngine::Engine.root
#   urls = File.open("#{ root }/posts_data/urls.txt").read.split("\n").reverse

#   urls.each do |url|
#     puts url

#     content = open(url).read
#     doc = Nokogiri::HTML(content)

#     title = doc.css('.j-e-title a').try(:first).try(:text)
#     first_image = doc.css('.j-e-text img:not(.i-ljuser-userhead)').try(:first).try(:[], 'src')

#     doc = Nokogiri::HTML( doc.css('.j-e-text').first.inner_html )
#     doc.css('.lj-like').remove
#     post_content =  doc.css('body').inner_html

#     if (content = post_content.split('<a name="cutid1"></a>')).size == 2
#       post = Post.new(
#         title: title,
#         raw_intro:   content.first,
#         raw_content: content.last,
#         state: :published
#       )
#       post.content_processing_for(user)
#       post.save!
#     else
#       post = Post.new(
#         title: title,
#         raw_content: content.first,
#         state: :published
#       )
#       post.content_processing_for(user)
#       PubCategoryRel.create(category: main_hub, item: post)

#       post.save!
#       post.keep_consistency!
#     end

#     if first_image

#       extname = File.extname(first_image)
#       basename = File.basename(first_image, extname)

#       file = Tempfile.new([basename, extname])
#       file.binmode

#       open(URI.parse(first_image)) do |data|
#         file.write data.read
#       end

#       file.rewind

#       post.attached_images.create!(user: user, file: img)
#     end

#     puts "POST #{ title } CREATED"
#   end
# end

# hubs_list = {
#   'Несладкие блюда' => [
#     'Салаты и закуски',
#     'Соусы',
#     'Супы',
#     'Вторые блюда',
#     'Молочные блюда'
#   ],

#   'Несладкая выпечка' => [
#     'Хлеб',
#     'Другая несладкая выпечка'
#   ],

#   'Торты и пирожные' => [
#     'Торты',
#     'Пирожные'
#   ],

#   'Тарт и тарталетки' => [],

#   'Сладкая выпечка' => [],

#   'Пироги и запеканки' => [
#     'Галеты'
#   ],

#   'Кексы и маффины' => [
#     'Пряные кексы',
#     'Капкейки',
#     'Банановые кексы и маффины'
#   ]

#   'Печенье' => [
#     'Овсяное печенье',
#     'Разное печенье',
#     'Мадлен'
#   ],

#   'Новогодняя выпечка' => [
#     'Пряники',
#     'Пряничные домики',
#     'Елки',
#     'Новогоднее печенье',
#     'Штоллены',
#     'Новогодние полена'
#   ],

#   'Постная выпечка' => [],
#   'Десерты и конфеты' => []
# }