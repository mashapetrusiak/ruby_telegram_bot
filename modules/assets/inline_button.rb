class FishSocket
  # This module assigned to creating InlineKeyboardButton
  module Inline_Button
    GET_ACCOUNT = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Отримати account', callback_data: 'get_account')
    HAVE_PROMO = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Є промокод?', callback_data: 'force_promo')
    ADDITION_MENU = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Меню', callback_data: 'advanced_menu')
  end
end
