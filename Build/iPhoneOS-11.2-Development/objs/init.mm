#import <Foundation/Foundation.h>

extern "C" {
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void ruby_init_device_repl(void);
void MREP_BA10819E49D44225B8639CDBCDEF892A(void *, void *);
void MREP_D69E075314FA4DB6A8AC61A3FCC6D5E9(void *, void *);
void MREP_12DDF1FDEB2C4303A2654FF61B6D0DC5(void *, void *);
void MREP_061B246B038F4B038DD5E9B3E4E04FA5(void *, void *);
void MREP_B14801352E38414F9C826C4D85939359(void *, void *);
void MREP_05CC69ABF9644B04BCC7DEE6AFC1A921(void *, void *);
void MREP_1ED8B8B62EFD40748A18171A9D71F3CE(void *, void *);
int rm_repl_port = 50585;
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
#if !__LP64__
	try {
#endif
	    void *self = rb_vm_top_self();
ruby_init_device_repl();
rb_define_global_const("RUBYMOTION_ENV", @"development");
rb_define_global_const("RUBYMOTION_VERSION", @"5.6");
MREP_BA10819E49D44225B8639CDBCDEF892A(self, 0);
MREP_D69E075314FA4DB6A8AC61A3FCC6D5E9(self, 0);
MREP_12DDF1FDEB2C4303A2654FF61B6D0DC5(self, 0);
MREP_061B246B038F4B038DD5E9B3E4E04FA5(self, 0);
MREP_B14801352E38414F9C826C4D85939359(self, 0);
MREP_05CC69ABF9644B04BCC7DEE6AFC1A921(self, 0);
MREP_1ED8B8B62EFD40748A18171A9D71F3CE(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
