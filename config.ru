require_relative './config/environment'

use Rack::MethodOverride
use EventsController
use UsersController
use CommentsController
run ApplicationController