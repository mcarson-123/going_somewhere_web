workers Integer(ENV['WEB_CONCURRENCY'] || 3)
threads Integer(ENV['WEB_MIN_THREADS']  || 1), Integer(ENV['WEB_MAX_THREADS'] || 4)

preload_app!

port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'
