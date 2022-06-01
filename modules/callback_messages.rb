class FishSocket
  module Listener
    # This module assigned to processing all callback messages
    module CallbackMessages
      attr_accessor :callback_message

      def process
        self.callback_message = Listener.message.message
        case Listener.message.data
        when 'get_account'
          Listener::Response.std_message('Немає акаунтів')
        when 'force_promo'
          Listener::Response.force_reply_message('Відправте промокод')
        when 'advanced_menu'
          Listener::Response.inline_message('Додаткове меню:', Listener::Response.generate_inline_markup([
              Inline_Button::HAVE_PROMO
          ]), true)
        end
      end

      module_function(
          :process,
          :callback_message,
          :callback_message=
      )
    end
  end
end
