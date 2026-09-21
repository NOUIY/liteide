# Vendored github/cmark-gfm 0.29.0.gfm.13 as a qmake static library.
TEMPLATE = lib

CONFIG += staticlib

TARGET = cmark

include(../../liteideutils.pri)

DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += CMARK_GFM_STATIC_DEFINE CMARK_GFM_EXTENSIONS_STATIC_DEFINE
INCLUDEPATH += . src extensions
!win32-msvc*: QMAKE_CFLAGS += -Wno-unused-parameter

SOURCES += \
        libcmark.cpp \
        src/arena.c \
        src/blocks.c \
        src/buffer.c \
        src/cmark.c \
        src/cmark_ctype.c \
        src/commonmark.c \
        src/footnotes.c \
        src/houdini_href_e.c \
        src/houdini_html_e.c \
        src/houdini_html_u.c \
        src/html.c \
        src/inlines.c \
        src/iterator.c \
        src/latex.c \
        src/linked_list.c \
        src/man.c \
        src/map.c \
        src/node.c \
        src/plaintext.c \
        src/plugin.c \
        src/references.c \
        src/registry.c \
        src/render.c \
        src/scanners.c \
        src/syntax_extension.c \
        src/utf8.c \
        src/xml.c \
        extensions/autolink.c \
        extensions/core-extensions.c \
        extensions/ext_scanners.c \
        extensions/strikethrough.c \
        extensions/table.c \
        extensions/tagfilter.c \
        extensions/tasklist.c

DISTFILES += \
    src/case_fold_switch.inc \
    src/entities.inc

HEADERS += \
    libcmark.h \
    cmark-gfm_export.h \
    cmark-gfm_version.h \
    src/buffer.h \
    src/chunk.h \
    src/cmark-gfm.h \
    src/cmark-gfm-extension_api.h \
    src/cmark_ctype.h \
    src/footnotes.h \
    src/houdini.h \
    src/html.h \
    src/inlines.h \
    src/iterator.h \
    src/map.h \
    src/node.h \
    src/parser.h \
    src/plugin.h \
    src/references.h \
    src/registry.h \
    src/render.h \
    src/scanners.h \
    src/syntax_extension.h \
    src/utf8.h \
    extensions/autolink.h \
    extensions/cmark-gfm-core-extensions.h \
    extensions/ext_scanners.h \
    extensions/strikethrough.h \
    extensions/table.h \
    extensions/tagfilter.h \
    extensions/tasklist.h
