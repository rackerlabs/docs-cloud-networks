# Rackspace Cloud Networks API documentation

[![Build Status](https://travis-ci.org/rackerlabs/docs-cloud-networks.svg?branch=master)](https://travis-ci.org/rackerlabs/docs-cloud-networks)

==========================================
## Resources

This github repository contains the source files for the following Rackspace Networks API documentation:

* [Cloud Networks Getting Started Guide](http://docs.rackspace.com/networks/api/v2/cn-gettingstarted/)
* [Cloud Networks Developer Guide](http://docs.rackspace.com/networks/api/v2/cn-devguide/)
* [Cloud Networks Release Notes](http://docs.rackspace.com/networks/api/v2/cn-releasenotes/)

## Contributing

Contributions are welcome! To suggest changes to the documentation, 
    submit an [issue](https://github.com/rackerlabs/docs-cloud-networks/issues) 
    or a [pull request](https://github.com/rackerlabs/docs-cloud-networks/pulls).

To make changes to a project, create your own fork of the project and send a pull request to have your changes reviewed 
    and merged into the master branch as appropriate.

### Building from Source

This repository uses Maven to generate the output documentation. Command line users can generate the complete output from this 
    repository by using the following command:

    mvn clean generate-sources

The output appears in PDF and HTML form in the following locations. The items in the **Name** column link to the location 
    where the documentation is published, when available.

| Name | Build Location |
| --- | --- |
| [Getting Started Guide](http://docs.rackspace.com/networks/api/v2/cn-gettingstarted) | target/docbkx/webhelp/cn-gettingstarted |
| [Developer Guide](http://docs.rackspace.com/networks/api/v2/cn-devguide/) | target/docbkx/webhelp/cn-devguide |

#### Editors

You can use any text editor to work with these source files. If you want to use an IDE, consider [NetBeans](http://netbeans.org). 
    This cross-platform IDE offers seamless support for Maven projects and does not require  additional configuration to open
    the **pom.xml** file as a project. You can configure the project so that the **Build** command, which appears when you 
    right-click a project in the **Projects** pane, executes the `clean generate-sources` command. To do so, perform the following 
    steps:

1. Right-click the project in the **Projects** pane and select **Properties**.
2. Select the **Build** category in the left pane, and then select the **Build project** action in the right pane.
3. Change **Execute Goals** to `clean generate-sources`.
4. *(Optional)* Repeat steps 2 and 3 for the **Clean and Build project** and **Build with Dependencies** actions.

### Quick Links

The files that are most likely to be of interest to you are as follows:

* [src/wadl/networks.wadl](src/resources/wadl/networks.wadl) - networks API operations wadl
* [src/wadl/ports.wadl](src/resources/wadl/ports.wadl) - ports API operations wadl
* [src/wadl/subnets.wadl](src/subnets/wadl/subnets.wadl) - subnets API operations wadl
* [src/docbkx/cn-devguide.xml](src/docbkx/cn-devguide.xml) - main source file for Developer's Guide
* [src/dockbkx/cn-gettingstarted.xml](src/dockbkx/cn-gettingstarted.xml) - main source file for Getting Started Guide
* [src/docbkx/cn-releasenotes.xml](src/docbkx/cn-releasenotes.xml) - main source file for Release Notes
* [src/docbkx/chapters](src/docbkx/chapters) - supplemental chapters and sections for the guides
    Note: Be aware that some chapters and sections are shared by both Guides, so make sure the change that you propose works for both.
* [rst/devguide](rst/devguide) - contains converted files; when you change the WADL also run the wadl2rst tool to generate new RST files in rst/devguide/api-operations

If you want to make changes to the example files referenced in the WADL file, you can find the example files at  
    [src/common/samples](src/common/samples).

The status codes, parameter lists, and other shared info referenced by the WADL files are at 
    [src/common/common.ent](src/common/common.ent).
