su -s /bin/bash -l postgres -c "psql -U postgres -c \"CREATE USER rails WITH PASSWORD 'qwerty';\""
su -s /bin/bash -l postgres -c "psql -U postgres -c \"ALTER ROLE rails WITH CREATEDB;\""

su -s /bin/bash -l postgres -c "createdb -E UTF8 -O rails eastflower"
su -s /bin/bash -l postgres -c "psql -U postgres -c \"GRANT ALL PRIVILEGES ON DATABASE eastflower TO rails;\""
