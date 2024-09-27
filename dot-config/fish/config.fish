if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH /Users/x/perl5/bin $PATH 2>/dev/null;
set -q PERL5LIB; and set -x PERL5LIB /Users/x/perl5/lib/perl5:$PERL5LIB;
set -q PERL5LIB; or set -x PERL5LIB /Users/x/perl5/lib/perl5;
set -q PERL_LOCAL_LIB_ROOT; and set -x PERL_LOCAL_LIB_ROOT /Users/x/perl5:$PERL_LOCAL_LIB_ROOT;
set -q PERL_LOCAL_LIB_ROOT; or set -x PERL_LOCAL_LIB_ROOT /Users/x/perl5;
set -x PERL_MB_OPT --install_base\ \"/Users/x/perl5\";
set -x PERL_MM_OPT INSTALL_BASE=/Users/x/perl5;

set -x MBLAZE /Users/x/.config/mail
