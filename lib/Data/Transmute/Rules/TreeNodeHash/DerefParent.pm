package Data::Transmute::Rules::TreeNodeHash::DerefParent;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

our @RULES = (
    [transmute_nodes => {
        rules => [
            [create_hash_key => {
                replace => 1,
                value_code => sub { ref $_[0] ? "$_[0]" : $_[0] },
            }],
        ],
    }],
);

1;
# ABSTRACT: Deref parent attributes in tree nodes to make it more dump-friendly

=head1 DESCRIPTION

Tree is an interlinked data structure, where a child node links back to its
parent (and the parent links back to *its* parent, and so on). This makes the
dump of a tree structure looks unwieldy; if you dump a node, you will end up
dumping the whole tree.

This rule walks the tree structure and replaces the value of hash key 'parent'
to its stringified value. This will make the structure more dump-friendly.
