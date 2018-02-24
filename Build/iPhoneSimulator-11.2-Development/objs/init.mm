#import <Foundation/Foundation.h>

extern "C" {
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void ruby_init_device_repl(void);
void MREP_0AE3E8050104494B91250C02DC020D85(void *, void *);
void MREP_0246557AF24D4EF38828F4F4980EC451(void *, void *);
void MREP_7FA2B764A4D84F63962AD5432F68BD73(void *, void *);
void MREP_733C8307310246A1A2B64387833AD352(void *, void *);
void MREP_2FF3A2D20FFC467F970A579A916F5C19(void *, void *);
void MREP_359E9C5B632745C78C003E19B71ACE21(void *, void *);
void MREP_115624E7F9F64A8693EB84AB93738268(void *, void *);
int rm_repl_port = 50461;
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
MREP_0AE3E8050104494B91250C02DC020D85(self, 0);
MREP_0246557AF24D4EF38828F4F4980EC451(self, 0);
MREP_7FA2B764A4D84F63962AD5432F68BD73(self, 0);
MREP_733C8307310246A1A2B64387833AD352(self, 0);
MREP_2FF3A2D20FFC467F970A579A916F5C19(self, 0);
MREP_359E9C5B632745C78C003E19B71ACE21(self, 0);
MREP_115624E7F9F64A8693EB84AB93738268(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
