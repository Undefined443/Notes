# Selenium 4

[Selenium Documentation](https://www.selenium.dev/documentation/webdriver/)

## Troubleshooting

无法启动 Chrome:

```output
Traceback (most recent call last):
  File "/Users/xiao/Library/Mobile Documents/com~apple~CloudDocs/Projects/PycharmProjects/ScoreCollector/计科前5学期成绩查询.py", line 32, in <module>
    driver = WebDriver(service=service)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/xiao/.local/share/virtualenvs/ScoreCollector-5YizM67E/lib/python3.11/site-packages/selenium/webdriver/chrome/webdriver.py", line 80, in __init__
    super().__init__(
  File "/Users/xiao/.local/share/virtualenvs/ScoreCollector-5YizM67E/lib/python3.11/site-packages/selenium/webdriver/chromium/webdriver.py", line 104, in __init__
    super().__init__(
  File "/Users/xiao/.local/share/virtualenvs/ScoreCollector-5YizM67E/lib/python3.11/site-packages/selenium/webdriver/remote/webdriver.py", line 286, in __init__
    self.start_session(capabilities, browser_profile)
  File "/Users/xiao/.local/share/virtualenvs/ScoreCollector-5YizM67E/lib/python3.11/site-packages/selenium/webdriver/remote/webdriver.py", line 378, in start_session
    response = self.execute(Command.NEW_SESSION, parameters)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/xiao/.local/share/virtualenvs/ScoreCollector-5YizM67E/lib/python3.11/site-packages/selenium/webdriver/remote/webdriver.py", line 440, in execute
    self.error_handler.check_response(response)
  File "/Users/xiao/.local/share/virtualenvs/ScoreCollector-5YizM67E/lib/python3.11/site-packages/selenium/webdriver/remote/errorhandler.py", line 209, in check_response
    raise exception_class(value)
selenium.common.exceptions.WebDriverException: Message: 

```

解决方法：关闭代理😂

[[🐛 Bug]:Python upgrading to selenium 4 raises exception: selenium.common.exceptions.WebDriverException: Message: #10710](https://github.com/SeleniumHQ/selenium/issues/10710)
