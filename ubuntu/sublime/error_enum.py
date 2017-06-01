# ln -s ~/Development/ubuntu/sublime/error_enum.py ~/.config/sublime-text-3/Packages/error_enum.py
import sublime, sublime_plugin
import random

class ErrorEnumCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    enum = ''
    enum += str(random.randint(1,9))
    for i in range(4):
      enum += str(random.randint(0,9))
    enum += ': '
    self.view.insert(edit, self.view.sel()[0].begin(), enum)
