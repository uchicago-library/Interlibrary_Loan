# Interlibrary Loan
Forms for Canvas and Reserves functionality.

## File Organization
### Student view and Instructor View
Atlas has two views depending on the users role. This extends to the include files as well.
- Student views have a "U" in front of the file name (Example: UCourseInfo.html)
- Instructor views have an "I" in front of the file name (Example: ICourseInfo.html)

### Includes
- `<#INCLUDE filename="include_head.html">` = All style and script links
<!-- - `<#INCLUDE filename="include_header.html">` = Top nav -->
- `<#INCLUDE filename="include_studentcoursemenu.html">` = Student Course Sidebar
- `<#INCLUDE filename="include_instructorcoursemenu.html">` = Instructor Course Sidebar
- `<#INCLUDE filename="include_defaultcourseinfo.html">` = Content block that include tags for pulling course name, course code, professor name, and semester.
- `<#INCLUDE filename="include_copyright.html">` = Copyright restrictions; needs to be included when reserve table is present.
- `<#INCLUDE filename="include_subscription.html">` = Alert box that asks user to turn on notifications.
- `<#INCLUDE filename="include_footer.html">` = Scripts that need to be at end of doc


## Test Server
Access: https://uchicago.ares.atlas-sys.com/ares/testweb/ares.dll
Need Canvas permissions and be enrolled in a (test) course to get access.

## ADA Code Style Guide
### Screen Reader Only Notes / Text
Use `<span class="visually-hidden"> ... </span>`


## License
This project is {exp:copyright:show} by [Atlas Systems](https://www.atlas-sys.com/), developer of OCLC’s ILLiad system.
