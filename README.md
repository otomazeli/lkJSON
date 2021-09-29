## lkJSON - Json Library for Delphi 6+ Originally from Leonid Koninin
Copyright (c) 2021 Maintained by Odimar Tomazeli otomazeli@gmx.com
Copyright (c) 2006,2007,2008,2009 Leonid Koninin leon_kon@users.sourceforge.net


### History Changes

```
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of the <organization> nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.

* THIS SOFTWARE IS PROVIDED BY Leonid Koninin ``AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL Leonid Koninin BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

####  changes:

```
  v1.07 06/11/2009 * fixed a bug in js_string - thanks to Andrew G. Khodotov
                   * fixed error with double-slashes - thanks to anonymous user
                   * fixed a BOM bug in parser, thanks to jasper_dale
  v1.06 13/03/2009 * fixed a bug in string parsing routine
                   * looked routine from the Adrian M. Jones, and get some
                     ideas from it; thanks a lot, Adrian!
                   * checked error reported by phpop and fix it in the string
                     routine; also, thanks for advice.
  v1.05 26/01/2009 + added port to D2009 by Daniele Teti, thanx a lot! really,
                     i haven't the 2009 version, so i can't play with it. I was
                     add USE_D2009 directive below, disabled by default
                   * fixed two small bugs in parsing object: errors with empty
                     object and list; thanx to RSDN's delphi forum members
                   * fixed "[2229135] Value deletion is broken" tracker
                     issue, thanx to anonymous sender provided code for
                     tree version
                   * fixed js_string according to "[1917047] (much) faster
                     js_string Parse" tracker issue by Joao Inacio; a lot of
                     thanx, great speedup!

  v1.04 05/04/2008 + a declaration of Field property moved from TlkJSONobject
                     to TlkJSONbase; thanx for idea to Andrey Lukyanov; this
                     improve objects use, look the bottom of SAMPLE2.DPR
                   * fixed field name in TlkJSONobject to WideString
  v1.03 14/03/2008 + added a code for generating readable JSON text, sended to
                     me by Kusnassriyanto Saiful Bahri, thanx to him!
                   * from this version, library distributed with BSD
                     license, more pleasure for commercial programmers :)
                   * was rewritten internal storing of objects, repacing
                     hash tables with balanced trees (AA tree, by classic
                     author's variant). On mine machine, with enabled fastmm,
                     tree variant is about 30% slower in from-zero creation,
                     but about 50% faster in parsing; also deletion of
                     objects will be much faster than a hash-one.
                     Hashes (old-style) can be switched on by enabling
                     USE_HASH directive below
  v1.02 14/09/2007 * fix mistypes in diffrent places; thanx for reports
                     to Aleksandr Fedorov and Tobias Wrede
  v1.01 18/05/2007 * fix small bug in new text generation routine, check
                     library for leaks by fastmm4; thanx for idea and comments
                     for Glynn Owen
  v1.00 12/05/2007 * some fixes in new code (mistypes, mistypes...)
                   * also many fixes by ideas of Henri Gourvest - big thanx
                     for him again; he send me code for thread-safe initializing
                     of hash table, some FPC-compatible issues (not tested by
                     myself) and better code for localization in latest
                     delphi versions; very, very big thanx!
                   * rewritten procedure of json text generating, with wich
                     work of it speeds up 4-5 times (on test) its good for
                     a large objects
                   * started a large work for making source code self-doc
                     (not autodoc!)
  v0.99 10/05/2007 + add functions to list and object:
                      function getInt(idx: Integer): Integer;
                      function getString(idx: Integer): String;
                      function getWideString(idx: Integer):WideString;
                      function getDouble(idx: Integer): Double;
                      function getBoolean(idx: Integer): Boolean;
                   + add overloaded functions to object:
                      function getDouble(nm: String): Double; overload;
                      function getInt(nm: String): Integer; overload;
                      function getString(nm: String): String; overload;
                      function getWideString(nm: String): WideString; overload;
                      function getBoolean(nm: String): Boolean; overload;
                   * changed storing mech of TlkJSONcustomlist descendants from
                     dynamic array to TList; this gives us great speedup with
                     lesser changes; thanx for idea to Henri Gourvest
                   * also reworked hashtable to work with TList, so it also
                     increase speed of work
  v0.98 09/05/2007 * fix small bug in work with WideStrings(UTF8), thanx to
                     IVO GELOV to description and sources
  v0.97 10/04/2007 + add capabilities to work with KOL delphi projects; for
                     this will define KOL variable in begin of text; of course,
                     in this case object TlkJSONstreamed is not compiled.
  v0.96 03/30/2007 + add TlkJSONFuncEnum and method ForEach in all
                     TlkJSONcustomlist descendants
                   + add property UseHash(r/o) to TlkJSONobject, and parameter
                     UseHash:Boolean to object constructors; set it to false
                     allow to disable using of hash-table, what can increase
                     speed of work in case of objects with low number of
                     methods(fields); [by default it is true]
                   + added conditional compile directive DOTNET for use in .Net
                     based delphi versions; remove dot in declaration below
                     (thanx for idea and sample code to Tim Radford)
                   + added property HashOf to TlkHashTable to allow use of
                     users hash functions; on enter is widestring, on exit is
                     cardinal (32 bit unsigned). Original HashOf renamed to
                     DefaultHashOf
                   * hash table object of TlkJSONobject wrapped by property called
                     HashTable
                   * fixed some minor bugs
  v0.95 03/29/2007 + add object TlkJSONstreamed what descendant of TlkJSON and
                     able to load/save JSON objects from/to streams/files.
                   * fixed small bug in generating of unicode strings representation
  v0.94 03/27/2007 + add properties NameOf and FieldByIndex to TlkJSONobject
                   * fix small error in parsing unicode chars
                   * small changes in hashing code (try to speed up)
  v0.93 03/05/2007 + add overloaded functions to list and object
                   + add enum type TlkJSONtypes
                   + add functions: SelfType:TlkJSONtypes and
                     SelfTypeName: String to every TlkJSONbase child
                   * fix mistype 'IndefOfName' to 'IndexOfName'
                   * fix mistype 'IndefOfObject' to 'IndexOfObject'
  v0.92 03/02/2007 + add some fix to TlkJSON.ParseText to fix bug with parsing
                     objects - object methods not always added properly
                     to hash array (thanx to Chris Matheson)
```                     
