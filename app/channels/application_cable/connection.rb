module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def find_verified_user
      return env['warden'].user if env['warden'].user # Retorna el usuario si existe
      
      reject_unauthorized_connection
    end


  end
end
