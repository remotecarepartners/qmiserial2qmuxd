CFLAGS=-std=c99 -Wall -Wextra -Werror
LDFLAGS=-lutil -pthread

all: qmiserial2qmuxd

qmiserial2qmuxd: qmiserial2qmuxd.o
	$(CC) qmiserial2qmuxd.o $(LDFLAGS) -o $@ -lpthread

clean:
	rm -f qmiserial2qmuxd qmiserial2qmuxd-android qmiserial2qmuxd.o

qmiserial2qmuxd.android:
	$(MAKE) $(MFLAGS) \
		CC=arm-linux-androideabi-gcc \
		CFLAGS="$(CFLAGS) -fPIE -DANDROID"\
		LDFLAGS="-fPIE -pie -llog" \
		qmiserial2qmuxd
