class Emailer < Subscriber
	def notify(source, data)
		path = File.dirname(__FILE__)
		File.open(path+'/notifications', 'a') do |notifications|
			notifications.puts Time.now
			notifications.puts data.size
			data.each do |image|
				notifications.puts image
			end
		end
	end
end