LINT: Spelling exclusions
=========================

Correct spelling problems within docs whenever possible but on occasions
when commands or error message strings are in the dictionary exclusions
can be added

.. code:: bash

   % make spelling

Spelling exclusion for a special string
---------------------------------------

- Ignore this `` :spelling:ignore:`bogus-word` ``
- Quoting: ``item``

Spelling exclusions by list
---------------------------

Exclude `foo, bar & tans` within a single document.
.. code:: bash

   `` .. spelling:: ``
      foo
      bar
      tans

.. seealso::

   [managing-lists-of-correctly-spelled-words-and-ignoring-words](https://sphinxcontrib-spelling.readthedocs.io/en/latest/customize.html#managing-lists-of-correctly-spelled-words-and-ignoring-words)
