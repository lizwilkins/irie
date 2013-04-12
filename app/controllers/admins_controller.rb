class AdminsController < ApplicationController
   before_filter :admin_required
end

class MarksController < ApplicationController
   before_filter :admin_required, only: %w(create update)
end