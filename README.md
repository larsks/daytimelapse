A set of scripts and systemd units to take timelapse photos using the
`raspistill` command and subsequently push those to google drive.

## Some notes about the systemd units

This was written for a camera taking pictures outside. It only makes
sense to take pictures when it's light out.  Ideally I would use a
light sensor, I guess, but I've opted for just picking a likely block
of time.

The `timelapse.timer` unit is response for starting
`timelapse.service` in the morning.  In the evening
`timelapse-off.timer` starts `timelapse-off.service`.  This is a no-op
service that has a `Conflicts` dependency on `timelapse.servce`, which
means that *starting* `timelapse-off.service` causes `timelapse.service`
to stop.

