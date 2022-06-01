class FishSocket
  module Listener
    # This module assigned to processing all standart messages
    module StandartMessages
      def process
        case Listener.message.text
        when '/get_account'
          Response.std_message 'Не має доступних акаунтів'
        when '/start'
          Response.inline_message 'Виберіть один із доступних дій', Response::generate_inline_markup(
            [
                Inline_Button::GET_ACCOUNT,
                Inline_Button::ADDITION_MENU
            ]
          )
        else
          unless Listener.message.reply_to_message.nil?
            case Listener.message.reply_to_message.text
            when /Отправьте промокод/
              return Listener::Response.std_message 'Промокод знайдено, ось акаунт :' if Promos::validate Listener.message.text

              return Listener::Response.std_message 'Промокод знайдено'
            end
          end
          Response.std_message 'Спробуйте щось інше'
        end
      end

      module_function(
        :process
      )
    end
  end
end
