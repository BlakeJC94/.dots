iabbrev <expr> @@d strftime('%Y-%m-%d')
iabbrev <expr> @@t strftime('%Y-%m-%dT%T%z')[:21] . ':00'

inoreabbrev <expr> ,u system('uuidgen')->trim()->tolower()

inoreabbrev rbm # TODO: remove before merging
inoreabbrev cbm # TODO: change before merging
inoreabbrev ubm # TODO: uncomment before merging
