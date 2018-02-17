#import <Foundation/Foundation.h>

extern "C" {
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void ruby_init_device_repl(void);
void MREP_A4AB930D0A6C4384A54372EEF16D1FEF(void *, void *);
void MREP_5683B358E23840758CD09FA9D347F162(void *, void *);
void MREP_8FDDDDB07F8D4E31B1853F6C14A8F420(void *, void *);
void MREP_1351204B12724A9797563FEA6C0914F2(void *, void *);
void MREP_B7351ACB75934D5A8CBDFD26CFFFC26F(void *, void *);
void MREP_842DE235EEE44CD3A84A460BB8889871(void *, void *);
void MREP_EA1EDD3194EB40539681B2A50D1D759E(void *, void *);
void MREP_B5EFC336257F45CA9F38B17E51FAEEB6(void *, void *);
void MREP_67B98CA6BB9449CCA42D86C720972CA1(void *, void *);
void MREP_1B5BAFF809784BAAB41216FC9A62F8FB(void *, void *);
void MREP_C4BD2FA75BF041228A6FC34BC7AB1F64(void *, void *);
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
MREP_A4AB930D0A6C4384A54372EEF16D1FEF(self, 0);
MREP_5683B358E23840758CD09FA9D347F162(self, 0);
MREP_8FDDDDB07F8D4E31B1853F6C14A8F420(self, 0);
MREP_1351204B12724A9797563FEA6C0914F2(self, 0);
MREP_B7351ACB75934D5A8CBDFD26CFFFC26F(self, 0);
MREP_842DE235EEE44CD3A84A460BB8889871(self, 0);
MREP_EA1EDD3194EB40539681B2A50D1D759E(self, 0);
MREP_B5EFC336257F45CA9F38B17E51FAEEB6(self, 0);
MREP_67B98CA6BB9449CCA42D86C720972CA1(self, 0);
MREP_1B5BAFF809784BAAB41216FC9A62F8FB(self, 0);
MREP_C4BD2FA75BF041228A6FC34BC7AB1F64(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
