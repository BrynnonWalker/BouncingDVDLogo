#import <Foundation/Foundation.h>

extern "C" {
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void ruby_init_device_repl(void);
void MREP_D175C54C169B48768F55CD6FA50DC424(void *, void *);
void MREP_17C6D53C579742F79776A20F68A424B2(void *, void *);
void MREP_E663D7B019FE4617A3063B4976002F98(void *, void *);
void MREP_BEB3B6242C0F47889893D858F75CD862(void *, void *);
void MREP_F0967680F30B48A98573C27ABC5B6300(void *, void *);
void MREP_9097F421DF174F77A7BCA9890885076F(void *, void *);
void MREP_70631D18EB0E45EA9AFEA8E392937DC1(void *, void *);
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
MREP_D175C54C169B48768F55CD6FA50DC424(self, 0);
MREP_17C6D53C579742F79776A20F68A424B2(self, 0);
MREP_E663D7B019FE4617A3063B4976002F98(self, 0);
MREP_BEB3B6242C0F47889893D858F75CD862(self, 0);
MREP_F0967680F30B48A98573C27ABC5B6300(self, 0);
MREP_9097F421DF174F77A7BCA9890885076F(self, 0);
MREP_70631D18EB0E45EA9AFEA8E392937DC1(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
