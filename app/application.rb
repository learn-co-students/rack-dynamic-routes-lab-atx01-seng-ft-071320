require 'pry'

class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            item = @@items.find do |i|
                if i.name == item_name
                resp.write i.price
                else
                    resp.write "Item not found"
                    resp.status = 400
                end
            end
        elsif req.path=="/testing"
            resp.write "Route not found"
            resp.status = 404
        # else 
        #     resp.write "Item not found"
        #     resp.status = 400
        end
        resp.finish
    end

end
