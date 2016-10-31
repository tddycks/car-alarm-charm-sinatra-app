require './config/environment'

use Rack::MethodOverride
use EventsController
use UsersController
use CommentsController
use AdminsController
run ApplicationController