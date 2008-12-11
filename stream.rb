
require 'PresentationFramework'
require 'WindowsFormsIntegration'

include System::Windows
include System::Windows::Controls
include System::Windows::Forms::Integration

def create_winforms_floating_window(control)
  w = Window.new
  w.Topmost = true
  w.WindowStyle = WindowStyle.ToolWindow
  host = WindowsFormsHost.new
  host.child = control
  w.Content = host
  w
end


