# Interlibrary Loan
Forms for Scan & Deliver and ILL requesting.

## File Organization
master branch: Atlas test and production servers
gh-pages: Mocks for approval and UX testing

### Includes
- `<#INCLUDE filename="include_head.html">` = All style and script links
- `<#INCLUDE filename="include_header.html">` = Top nav
- `<#INCLUDE filename="include_menu.html">` = Sidebar
- `<#INCLUDE filename="include_request_buttons.html">` = Submit button and "Your request is searched..." text
- `<#INCLUDE filename="include_footer.html">` = Scripts that need to be at end of doc
- `<#INCLUDE filename="include_request_cited.html">` = "Where did you learn about this item?" block
- `<#INCLUDE filename="include_copyright.html">` = Copyright restrictions; needs to be included when scans or PDFs are supplied.

## Test Server
Access: https://requests.lib.uchicago.edu/illiad/testweb/
Need ILLiad login to view

## ADA Code Style Guide
### Organization
- `<section> ... </section>` is used for related groups of fields. It adds a white dividing line between each section for visual grouping.
- `<div class="form-group"> ... </div> ` is used to group together label and input.
- `<div class="form-group row"> ... </div>` groups side by side fields.

### Requiered Fields
Get `<abbr title="required">*</abbr>`

**Example code:**

```
<div class="form-group">
    <label for="LoanAuthor"><span class="<#ERROR name="ERRORLoanAuthor">">Author/Editors</span><abbr title="required">*</abbr></label>
	<input type="text" id="LoanAuthor" name="LoanAuthor" class="form-control" value="<#PARAM name="LoanAuthor">">
</div>
```

### Fieldset
Only used for groupings of form controls (like groups of related checkboxes and radio buttons). Not used on drop down menu selections. Group these form controls using `<fieldset>` and `<legend>`. Using `<fieldset>` and `<legend>` ensures that the text description is read to screen reader users.

`<fieldset>` = entire grouping
`<legend>` = the grouping's descriptive text.

Documentation from [WebAIM](https://webaim.org/techniques/forms/).

### Notes / Help Text
If a field has notes or help text, the input of that field gets `aria-describedby=" [ id of help text ] "`

**Example code:**

```
<div class="col-sm-4">
    <label for="ISSN"><span class="<#ERROR name="ERRORISSN">">ISSN/ISBN</span></label>
    <input type="text" id="ISSN" name="ISSN" aria-describedby="ISSNHelp" class="form-control" value="<#PARAM name="ISSN">">
    <small id="ISSNHelp" class="form-text text-muted"><em>Example:</em> 0028-0836</small>
</div>
```

### Screen Reader Only Notes / Text
Use `<span class="sr-only"> ... </span>`

**Example code:**

```
<div class="col-sm-6">  
    <label for="NotWantedAfter"><span class="<#ERROR name="ERRORNotWantedAfter">">Not Wanted After Date</span><abbr title="required">*</abbr></label>
    <input type="text" id="NotWantedAfter" name="NotWantedAfter" class="form-control" value="<#PARAM name="NotWantedAfter">">
    <small id="NotWantedAfterHelp" class="form-text text-muted"><span class="sr-only">Default date auto-generated into field is 1 month from today. If you want to change, format with</span> (MM/DD/YYYY)</small>
</div>
```

### Tabindex
Is not used. The tabindex item only needs to be used if a span is given the role button, such as: `<span role="button" tabindex="0"` via documentation from [Paciello Group](https://developer.paciellogroup.com/blog/2014/08/using-the-tabindex-attribute/). Further reading on tabindex on [WebAIM](https://webaim.org/techniques/keyboard/tabindex).

## License
This project is {exp:copyright:show} by [Atlas Systems](https://www.atlas-sys.com/), developer of OCLC’s ILLiad system.
