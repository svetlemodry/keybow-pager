require 'keybow-pager/keybow'

operations = {}

function operations.browser_tab_back()
    keybow.tap_key_with_modifiers(keybow.PAGEUP, keybow.LEFT_CTRL)
end

function operations.browser_tab_forward()
    keybow.tap_key_with_modifiers(keybow.PAGEDOWN, keybow.LEFT_CTRL)
end

function operations.browser_close_tab()
    keybow.tap_key_with_modifiers('w', keybow.LEFT_CTRL)
end

function operations.browser_reopen_tab()
    keybow.tap_key_with_modifiers('t', keybow.LEFT_CTRL, keybow.LEFT_SHIFT)
end

function operations.browser_open_copied_link()
    keybow.tap_key(keybow.COPY)
    keybow.sleep(100)
    keybow.tap_key_with_modifiers('t', keybow.LEFT_CTRL)
    keybow.tap_key(keybow.PASTE)
    keybow.tap_key(keybow.ENTER)
end

function operations.service_account_template()
    keybow.text([[
username: 
ticket: 
description: 
teamemail: 
requester: 

]])
end

function operations.text_bigger()
    keybow.tap_key_with_modifiers(keybow.KPPLUS, keybow.LEFT_CTRL)
end

function operations.text_smaller()
    keybow.tap_key_with_modifiers(keybow.KPMINUS, keybow.LEFT_CTRL)
end

function operations.scroll_up()
    keybow.tap_key(keybow.PAGEUP)
end

function operations.scroll_down()
    keybow.tap_key(keybow.PAGEDOWN)
end

function operations.pycharm_back()
    keybow.tap_key_with_modifiers('b', keybow.LEFT_META)
end

function operations.pycharm_to_declaration()
    keybow.tap_key_with_modifiers(keybow.LEFT_ARROW, keybow.LEFT_META, keybow.LEFT_ALT)
end

function operations.git_commit_a()
    keybow.text("git commit -a")
    keybow.tap_enter()
end

function operations.git_pull()
    keybow.text("git pull")
    keybow.tap_enter()
end

function operations.git_tree()
    keybow.text("git tree")
    keybow.tap_enter()
end

function operations.git_push()
    keybow.text("git push")
    keybow.tap_enter()
end

function operations.open_chrome()
	spotlight("chrome")
end

function operations.open_firefox()
    modifier(keybow.F2, keybow.LEFT_ALT)
    keybow.sleep(100)
    keybow.text("firefox")
    keybow.sleep(100)
    keybow.tap_enter()
end

function operations.open_vivaldi()
    modifier(keybow.F2, keybow.LEFT_ALT)
    keybow.sleep(100)
    keybow.text("vivaldi")
    keybow.sleep(100)
    keybow.tap_enter()
end

function operations.open_thunderbird()
    modifier(keybow.F2, keybow.LEFT_ALT)
    keybow.sleep(100)
    keybow.text("thunderbird")
    keybow.sleep(100)
    keybow.tap_enter()
end

function spotlight(command)
    modifier(keybow.SPACE, keybow.LEFT_META)
    keybow.sleep(500)
    keybow.text(command)
    keybow.sleep(500)
    keybow.tap_enter()
    keybow.sleep(500)
end

