.. _devguide-common-date-time-format:

Date and time format
~~~~~~~~~~~~~~~~~~~~~

Rackspace Cloud services use an ISO 8601 compliant date format for the
display and consumption of date and time values.

The system time is expressed as UTC.


**Example: Date and time format**

.. code:: 

    yyyy-MM-dd'T'HH:mm:ssZ

For example, the UTC-5 format for May 19, 2015 at 8:07:08 a.m. is 

.. code::

    2015-05-19T08:07:08-05:00

**Date and time format codes**

+------+-----------------------------------------------------------+
| Code | Description                                               |
+======+===========================================================+
| yyyy | Four digit year                                           |
+------+-----------------------------------------------------------+
| MM   | Two digit month                                           |
+------+-----------------------------------------------------------+
| DD   | Two digit day                                             |
+------+-----------------------------------------------------------+
| T    | Separator for date/time                                   |
+------+-----------------------------------------------------------+
| HH   | Two digit hour (00-23)                                    |
+------+-----------------------------------------------------------+
| mm   | Two digit minute                                          |
+------+-----------------------------------------------------------+
| ss   | Two digit second                                          |
+------+-----------------------------------------------------------+
| Z    | ISO 8601 timezone (offset from GMT). If Z is not replaced |
|      | with the offset from GMT, it indicates a 00:00 offset.    |
+------+-----------------------------------------------------------+