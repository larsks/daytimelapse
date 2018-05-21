prefix = /usr/local
bindir = $(prefix)/bin

SERVICES = \
	   timelapse.service \
	   timelapse-off.service
TIMERS =   timelapse.timer \
	   timelapse-off.timer
UNITS = $(SERVICES) $(TIMERS)

SCRIPTS = timelapse
		
all:

install: install-units install-scripts

install-units: $(UNITS)
	for unit in $(UNITS); do \
		install -o root -g root -m 644 $$unit /etc/systemd/system/; \
	done
	systemctl daemon-reload

install-scripts: $(SCRIPTS)
	for script in $(SCRIPTS); do \
		install -o root -g root -m 755 $$script $(bindir); \
	done

activate-timers:
	systemctl enable --now $(TIMERS)
