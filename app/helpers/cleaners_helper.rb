# -*- coding: utf-8 -*-
module CleanersHelper
  def mailto()
    "mailto:sp@esm.co.jp?subject='#{mail_subject}'&amp;body='#{mail_body}'"
  end

  private
  def mail_subject
    "【掃除当番連絡】10月10日〜10月15日"
  end

  private
  def mail_body
<<-EOD
【テーブル拭き】
　→ #{@wipingers.map(&:name).join(', ')}
　　*期間中3回を目安に（月・水・金など）できるだけ朝お願いします*

【ゴミ捨て】
　→ #{@thowers.map(&:name).join(', ')}
　　*期間中2回を目安に（火・木など）*

【掃除機】
　→ #{@vacuumers.map(&:name).join(', ')}
　　*期間中1回(9時前または18時30分以降)*
EOD
  end
end
