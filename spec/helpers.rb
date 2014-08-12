# See: https://www.relishapp.com/rspec/rspec-core/docs/helper-methods/define-helper-methods-in-a-module
module Helpers
  def run_rp_with_input(*inputs)
    shell_output = ""
    IO.popen('DB=test ./rp', 'r+') do |pipe|
      inputs.each do |input|
        pipe.puts input
      end
      pipe.close_write
      shell_output = pipe.read
    end
    shell_output
  end
end
