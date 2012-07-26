# -*- coding: utf-8 -*-
module UsersHelper
  # TODO: i18n
  def status_to_message(status)
    case status
    when 'todo'
      "未実施"
    when 'doing'
      "今週!"
    when 'done'
      "実施済み"
    else
    end
  end
end
