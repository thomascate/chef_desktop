apm 'linter'

# execute 'killall Finder' do
#   action :nothing
# end
#
# execute 'killall SystemUIServer' do
#   action :nothing
# end
#
# mac_default 'show hidden files (whose name starts with dot) in finder' do
#   domain 'com.apple.finder'
#   key 'AppleShowAllFiles'
#   value true
#   notifies :run, 'execute[killall Finder]'
# end
#
# mac_default 'show full file path in finder windows' do
#   domain 'com.apple.finder'
#   key '_FXShowPosixPathInTitle'
#   value true
#   notifies :run, 'execute[killall Finder]'
# end
#
# mac_default 'dont write DS_Store files to network shares' do
#   domain 'com.apple.desktopservices'
#   key 'DSDontWriteNetworkStores'
#   value true
#   notifies :run, 'execute[killall Finder]'
# end
#
# mac_default 'dont ask to use external drives as a Time Machine backup' do
#   domain 'com.apple.TimeMachine'
#   key 'DoNotOfferNewDisksForBackup'
#   value true
#   notifies :run, 'execute[killall Finder]'
# end
#
# mac_default 'set a fast keyboard repeat rate' do
#   domain 'NSGlobalDomain'
#   key 'KeyRepeat'
#   value 2
#   notifies :run, 'execute[killall Finder]'
# end
#
# mac_default 'set a fast keyboard initial key repeat' do
#   domain 'NSGlobalDomain'
#   key 'InitialKeyRepeat'
#   value 15
#   notifies :run, 'execute[killall Finder]'
# end
#
# mac_default 'disable hold key for special characters' do
#   domain 'NSGlobalDomain'
#   key 'ApplePressAndHoldEnabled'
#   value false
#   notifies :run, 'execute[killall Finder]'
# end
#
# mac_default 'disable auto-correct' do
#   domain 'NSGlobalDomain'
#   key 'NSAutomaticSpellingCorrectionEnabled'
#   value false
# end
#
# mac_default 'speed up mission control animations' do
#   domain 'com.apple.dock'
#   key 'expose-animation-duration'
#   value 0.1
# end
#
# mac_default 'remove the auto-hiding dock delay' do
#   domain 'com.apple.dock'
#   key 'autohide-delay'
#   value 0
# end
#
# mac_default 'save screenshots in PNG format' do
#   domain 'com.apple.screencapture'
#   key 'type'
#   value 'png'
# end
#
# mac_default 'save screenshots to user screenshots directory instead of desktop' do
#   domain 'com.apple.screencapture'
#   key 'location'
#   value '/Users/davidechols/screenshots'
#   notifies :run, 'execute[killall SystemUIServer]'
# end
#
# directory '/Users/davidechols/screenshots' do
#   owner 'davidechols'
# end
#
# mac_default 'disable menu transparency' do
#   domain 'com.apple.universalaccess'
#   key 'reduceTransparency'
#   value true
#   notifies :run, 'execute[killall SystemUIServer]'
# end
#
# mac_default 'increase contrast' do
#   domain 'com.apple.universalaccess'
#   key 'increaseContrast'
#   value true
#   notifies :run, 'execute[killall SystemUIServer]'
# end
#
# mac_default 'disable spotlight universal search (dont send info to Apple)' do
#   domain 'com.apple.safari'
#   key 'UniversalSearchEnabled'
#   value false
# end
#
# mac_default 'disable mouse enlargement with jiggle (OSX 10.11 El Capitan fix)' do
#   domain '~/Library/Preferences/.GlobalPreferences'
#   key 'CGDisableCursorLocationMagnification'
#   value true
#   notifies :run, 'execute[killall SystemUIServer]'
# end
