user = 'tcate'

execute 'killall Finder' do
  action :nothing
end

execute 'killall SystemUIServer' do
  action :nothing
end

mac_default 'show hidden files (whose name starts with dot) in finder' do
  domain 'com.apple.finder'
  key 'AppleShowAllFiles'
  user user
  value 1
  notifies :run, 'execute[killall Finder]'
end

mac_default 'show full file path in finder windows' do
  domain 'com.apple.finder'
  key '_FXShowPosixPathInTitle'
  user user
  value 1
  notifies :run, 'execute[killall Finder]'
end

mac_default 'dont write DS_Store files to network shares' do
  domain 'com.apple.desktopservices'
  key 'DSDontWriteNetworkStores'
  user user
  value 1
  notifies :run, 'execute[killall Finder]'
end

mac_default 'dont ask to use external drives as a Time Machine backup' do
  domain 'com.apple.TimeMachine'
  key 'DoNotOfferNewDisksForBackup'
  user user
  value 1
  notifies :run, 'execute[killall Finder]'
end

mac_default 'disable hold key for special characters' do
  domain 'NSGlobalDomain'
  key 'ApplePressAndHoldEnabled'
  user user
  value 0
  notifies :run, 'execute[killall Finder]'
end

mac_default 'disable auto-correct' do
  domain 'NSGlobalDomain'
  key 'NSAutomaticSpellingCorrectionEnabled'
  user user
  value 0
end

mac_default 'speed up mission control animations' do
  domain 'com.apple.dock'
  key 'expose-animation-duration'
  user user
  value 0.1
end

mac_default 'save screenshots in PNG format' do
  domain 'com.apple.screencapture'
  key 'type'
  user user
  value 'png'
end

mac_default 'save screenshots to user screenshots directory instead of desktop' do
  domain 'com.apple.screencapture'
  key 'location'
  user user
  value "/Users/#{user}/screenshots"
  notifies :run, 'execute[killall SystemUIServer]'
end

directory "/Users/#{user}/screenshots" do
  owner user
end

mac_default 'disable mouse enlargement with jiggle (OSX 10.11 El Capitan fix)' do
  domain '~/Library/Preferences/.GlobalPreferences'
  key 'CGDisableCursorLocationMagnification'
  user user
  value 1
  notifies :run, 'execute[killall SystemUIServer]'
end


mac_default 'improve bluetooth minimum audio quality' do
  domain 'com.apple.BluetoothAudioAgent'
  key 'Apple Bitpool Min (editable)'
  user user
  value 60
end

mac_default 'improve bluetooth maximum audio quality' do
  domain 'com.apple.BluetoothAudioAgent'
  key 'Apple Bitpool Max (editable)'
  user user
  value 80
end

mac_default 'improve bluetooth initial audio quality' do
  domain 'com.apple.BluetoothAudioAgent'
  key 'Apple Initial Bitpool (editable)'
  user user
  value 70
end

mac_default 'disable system beep' do
  domain 'com.apple.sound.beep'
  key 'feedback'
  user user
  value 0
  notifies :run, 'execute[killall SystemUIServer]'
end

mac_default 'disable UI sounds' do
  domain 'com.apple.systemsound'
  key 'com.apple.sound.uiaudio.enabled'
  user user
  value 0
  notifies :run, 'execute[killall SystemUIServer]'
end

mac_default 'disable UI alert' do
  domain 'com.apple.systemsound'
  key 'com.apple.sound.beep.volume'
  user user
  value 0
  notifies :run, 'execute[killall SystemUIServer]'
end
