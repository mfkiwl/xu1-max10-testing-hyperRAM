#include <iomanip>
#include <boost/test/auto_unit_test.hpp>

#include "iof/coutf.hpp"
#include "iof/cinf.hpp"
#include "iof/tostr.hpp"
#include "iof/omanips.hpp"
#include "iof/fmt_guard.hpp"
#include "stream_fmt_out.hpp"
using namespace iof;


struct SINNum 
{
    int hi, med, low;
    
    SINNum(int hi, int med, int low): hi(hi), med(med), low(low) {}
};


std::ostream& operator<<(std::ostream& out, const SINNum& sin) 
{
    prints(out, "%03s %03s %03s", sin.hi, sin.med, sin.low);
    return out;
}


BOOST_AUTO_TEST_SUITE( suiteExample );

BOOST_AUTO_TEST_CASE( testExample )
{
    bool isSenior=true;
    SINNum sin(123, 56, 89);
    std::string out( tostr("Hi %s, ptr=%#06xs, senior=%as, high=%4.1fs cm, "
        "SIN=%s, radius=%+ 12.2Gs m", 
        "dude", 0x0017, isSenior, 178.56, sin, 5432.1e3, eol) );
    BOOST_CHECK_EQUAL(out, "Hi dude, ptr=0x0017, senior=true, high=178.6 cm, SIN=123 056 089, radius=+   5.4E+006 m\n");
    
    std::string out2 = tostr("%!<6s%!>3s", 999, "");
    BOOST_CHECK_EQUAL( out2, "<<<999>>>");

    // check persistent format
    std::ostringstream out3;
    prints(out3, "Bytes are: ");
    stream_fmt fmtSave(out3);
    {
        fmt_guard fmt(out3, "%*6.2f");
        prints(out3, "%s, %5s, %!^7s, %.3s",1.0,1.0,1.0,1.0);
        std::string expect( tostr("Bytes are: %*6.2fs, %*5.2fs, %!^7.2fs, %*6.3fs",1.0,1.0,1.0,1.0) );
        //cout << "Got:        " << out3.str() << std::endl;
        //cout << "Should get: " << expect << std::endl;
        BOOST_CHECK_MESSAGE(out3.str() == expect, out3.str());
    }
    BOOST_CHECK_EQUAL(fmtSave, stream_fmt(out3));

    // check persistent format for tostr
    std::string out4 = tostr("'%*5.2fS, %s; %4.1S, %!^s'",1.0,2.0, 1.0,2.0);
    BOOST_CHECK_EQUAL("'*1.00, *2.00; *1.0, ^2.0'", out4);
    
    //float input;
    //while (cinf("%s,", input)) coutf("Input: '%s'\n", input);
}

BOOST_AUTO_TEST_CASE( testExample2 )
{
    // understand input stream manipulators
    if (0) 
    {
        std::string test = "11 11 11 0 1 false true 0 1";
        std::istringstream tests(test);
        int int1, int2, int3;
        tests >> std::dec >> int1 >> std::hex >> int2 >> std::oct >> int3;
        coutf("%s=11, %s=17, %s=9\n", int1, int2, int3);
        bool bool1, bool2, bool3, bool4, bool5, bool6;
        tests >> bool1 >> bool2 >> std::boolalpha >> bool3 >> bool4 >> std::noboolalpha >> bool5 >> bool6;
        coutf("%s=0, %s=1, %s=0, %s=1, %s=0, %s=1\n", bool1, bool2, bool3, bool4, bool5, bool6);
        
        std::istringstream testStr("%s abc");
        //testStr.skip_past(3);
        std::string result;
        testStr >> result;
        coutf("'%s abc' -> '%s'\n", result);
        
        std::istringstream testWS("123 456   true   321");
        testWS >> int1 >> int2 >> std::boolalpha >> bool1 >> int3;
        BOOST_CHECK_EQUAL(int1, 123);
        BOOST_CHECK_EQUAL(int2, 456);
        BOOST_CHECK_EQUAL(int3, 321);
        BOOST_CHECK(bool1);
        
        std::istringstream testSkipWS("abc  def  ghi");
        testSkipWS >> std::noskipws >> result >> test;
        coutf("Skip ws: '%s', '%s'\n", result, test);
    }
}
    
BOOST_AUTO_TEST_SUITE_END();

