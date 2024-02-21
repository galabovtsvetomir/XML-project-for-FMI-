# Documentation for Course Project: XML Technologies for Semantic Web

## Sofia University "St. Kliment Ohridski"
### Faculty of Mathematics and Informatics
### Bachelor's Program in Software Engineering
### Subject: XML Technologies for Semantic Web
### Winter Semester, 2023/2024

---

## Table of Contents

1. [Introduction](#introduction)
2. [Solution Analysis](#solution-analysis)
    - 2.1 [Workflow](#workflow)
    - 2.2 [Content Structure](#content-structure)
    - 2.3 [Type and Representation of Content](#type-and-representation-of-content)
3. [Design](#design)
4. [Testing](#testing)
5. [Conclusion and Future Development](#conclusion-and-future-development)
6. [Work Distribution](#work-distribution)
7. [Used Literature Sources and Websites](#used-literature-sources-and-websites)

---

## 1. Introduction

This document serves as a template for formatting the documentation of a course project for the subject "XML Technologies for Semantic Web". The requirements for the development and presentation of the project are described on the subject's website in Moodle.

### Development Guidelines:
- The information in this document is up-to-date.
- Our project allows quick browsing of profiles of football clubs, managers, and championships.
- The problem is resolved through an XML-based catalog that stores basic information about the objects in question and logically unifies them.
- Below in the document, information about our analysis of the solution, design, testing, and conclusion for future development of the project is provided.

## 2. Solution Analysis

### 2.1 Workflow

The workflow is as follows:
- Data is retrieved from wikipedia.org and google.com.
- They are manually entered into the document, maintaining a hierarchical order described below.
- The output is structured information that the user can use for their purposes.

### 2.2 Content Structure

The project contains three main types of data:
1. Elements of type game
2. Elements of type creator
3. Elements of type area

As can be seen, elements of type game have a unique identification number, as well as references to the application area, the genre they originate from, and their creator. Genres and creators have only a unique identification number.

### 2.3 Type and Representation of Content

We have used 4 text files:
- seriousGames.xml – Size: 17502b
- seriousGames.xsl - Size: 10282b
- seriousGames.dtd - Size: 1380b
- seriousGames.pdf - Size: 12099921b

We have used 28 image files:
- dragonBox_cover.jpg - Size: 620kb
- dragonBox_screenshot1.jpg - Size: 92kb
- ...
- wube_logo.jpg – Size: 38kb

## 3. Design

### 3.1 Data Connectivity

As mentioned in section 2.2, the connections in the project are as follows:
- game -> genre
- game -> creator
- game -> alluvial Area

To achieve these connections, we use the following attributes:
- game -> genre - genreRef=""
- game -> creator - creatorRef=""
- game -> alluvial Area - alluvialAreaRef=""

### 3.2 Validation

Validation through DTD is expressed in that every element, attribute of an element, or sub-element is explicitly declared:
- Whether an element can have a value, whether it will be parsed by the processor or not.
- What sub-elements/attributes an element has.
- In what sequence the sub-elements should be, which of them are mandatory or optional, which of them can be repeated more than once.
- For example, for validating the game element, we have used the following:
  ```xml
  <!ELEMENT game (title, description, releaseDate, graphics)>
  <!ATTLIST game id ID #REQUIRED>
  <!ATTLIST game genreRef IDREF #REQUIRED>
  <!ELEMENT name (#PCDATA)>
  <!ELEMENT description (#PCDATA)>
  <!ATTLIST game alluvialAreaRef IDREF #REQUIRED>
  <!ATTLIST game creatorRef IDREF #REQUIRED>
  <!ELEMENT title (#PCDATA)>
  <!ELEMENT releaseDate (#PCDATA)>

  ...
4  Testing
5  Conclusion and Future Development
6  Work Distribution
7  Used Literature Sources and Websites

---

## 4. Testing

Here's how we tested the proposed solution:

- We conducted DTD validation to ensure the validity and proper formatting of our project.
- The final result is presented in PDF format, which is universally compatible across different platforms for viewing PDF files.
- Examples from the final result are provided for reference.

## 5. Conclusion and Future Development

The outcome of the project is a simplified portfolio in PDF format. Due to the absence of any visual effects, this serves as an easy-to-use catalog focusing on conveying information. In today's world, numerous formats for information transfer could achieve the same objective. An example of such a format is JSON, which to a large extent can offer the same functionalities as XML.

This project is suitable for quick references for individuals interested in serious video games as well as those unfamiliar with the subject matter. It encompasses only the most essential attributes of the objects and can be utilized for swift game overviews and enhancing general knowledge about serious games, their main types, and application areas.

## 6. Work Distribution

Work was distributed as follows:

Todor Kermedzhiev:
- XML file validation through DTD
- Transformation from XML to PDF using an XSLT file

Tsvetomir Galabov:
- Design creation
- Gathering and embedding information
- Documentation preparation

## 7. Used Literature Sources and Websites

Literature sources and websites used for this project:

1. [Wikipedia](https://en.wikipedia.org/wiki/Main_Page) - provided all information about the objects in the project, including images.
2. [Apache FOP](https://xmlgraphics.apache.org/fop/)
3. Google
4. [GitHub - Apache FOP](https://github.com/apache/xmlgraphics-fop)
5. [xsl:fo - IBM](https://www.ibm.com/developerworks/library/x-xslfo/)
6. Lectures and exercises from XML Technologies for Semantic Web, Winter Semester 2023/2024.

