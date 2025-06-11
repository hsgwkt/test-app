use strict;
use warnings;

my $filename = '.github/workflows/deploy.yml';
my $content = do {
    local $/ = undef;
    open my $fh, '<', $filename or die "Could not open $filename: $!";
    <$fh>;
};

# Regex attempt 3: Be very precise with current known structure
$content =~ s{
    (       # $1: "Install dependencies" step
        \s*-\s*name:\s*Install dependencies\n
        \s*run:\s*npm install --force # --force はサブタスクでの問題を回避するため一時的に使用する場合がありますが、通常は不要です\n
    )
    (?:     # Non-capturing group for the first optional block
        \s*-\s*name:\s*Lint code\n
        \s*run:\s*npm run lint\n
    )?      # Makes the "Lint code" block optional
    (?:     # Non-capturing group for the second optional block
        \s*-\s*name:\s*Type check\n
        \s*run:\s*npm run type-check\n
    )?      # Makes the "Type check" block optional
    (       # $2: "Build project" step name line
        \s*-\s*name:\s*Build project
    )
}
{$1\n      - name: Run checks\n        run: npm run check\n$2}smx; # s allows . to match newline, m for ^$ per line, x for comments

open my $fh_out, '>', $filename or die "Could not write to $filename: $!";
print $fh_out $content;
close $fh_out;

print "Workflow file updated by perl script (attempt 3).\n";
