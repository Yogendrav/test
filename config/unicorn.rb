root = "/home/deployer/apps/auctus.klijent.com.hr/current"
#root = "/home/deployer/apps/demo.klijent.com.hr/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.auctus.sock"
#listen "/tmp/unicorn.demo.sock"
worker_processes 2
timeout 30


#auctus
