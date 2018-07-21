require 'plezi'

class UsersController
    def index
        "All Users"
    end
    def show
      "I would love to show you #{params[:id]}... later."
    end
    def foo
      "Catfish"
    end
end
Plezi.route "/users", UsersController
exit
