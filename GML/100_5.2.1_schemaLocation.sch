<?xml version="1.0" encoding="UTF-8"?>
<!--    =============================================================================================
    Copyright, license, and disclaimer
    © Copyright 2026 International Hydrographic Organization (IHO)
    
    License
    Permission to copy and distribute this document is hereby granted provided that this notice is
    retained on all copies, and that the IHO is credited when the material is redistributed
    or used in part or whole in derivative works.
    Redistributions in binary form must reproduce this notice in the documentation and/or other
    materials provided with the distribution.
    
    Disclaimer
    This work is provided by the copyright holders and contributors "as is" and any express or implied
    warranties, including, but not limited to, the implied warranties of merchantability and fitness
    for a particular purpose are disclaimed. In no event shall the copyright owner or contributors be
    liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including,
    but not limited to, procurement of substitute goods or services; loss of use, data, or profits; or
    business interruption) however caused and on any theory of liability, whether in contract, strict
    liability, or tort (including negligence or otherwise) arising in any way out of the use of this
    software, even if advised of the possibility of such damage.
    ============================================================================================= -->
<!--    =============================================================================================
    Version 0.1-20250106: Initial version from S-100 5.2.1 Part 10b clause 10b-11.1
        This file was prepared by RMM - Raphael Malyankar (Portolan Sciences LLC) from the example in S-100 5.2.1 clause 10b-11.1
        Modified by RMM to add namespace for xsi namespace as sch:ns element
    Description: Schematron validation checks to ensure that compliant products also include the correct schemaLocation
    Note       : Validation using Schematron rule files and XML schemas (XSD files) are in principle separate. XML tools
        may apply them in separate steps each requring manual triggering or in a pipeline, depending on the method used to
        validate instance documents.
    ============================================================================================= -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" queryBinding="xslt2"> 
    <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
    <sch:pattern id="check-inline-schemaLocation"> 
        <sch:rule context="*">
            <sch:p>Note that this rule just checks for the existence of a schemaLocation attribute and does not validate the content of the schemaLocation attribute</sch:p>
            <!-- Check for xmlns:S100 and schemaLocation on the same element --> 
            <sch:assert test="not(namespace::*[name() = 'S100']) or @xsi:schemaLocation"> 
                If 'xmlns:S100' is declared on this element, it must also include an 'xsi:schemaLocation' attribute. 
            </sch:assert> 
            <!-- Check for xmlns:s100_profile and schemaLocation on the same element --> 
            <sch:assert test="not(namespace::*[name() = 's100_profile']) or @xsi:schemaLocation"> 
                If 'xmlns:s100_profile' is declared on this element, it must also include an 'xsi:schemaLocation' 
                attribute.
            </sch:assert> 
        </sch:rule> 
    </sch:pattern> 
</sch:schema> 