#include "libcmark.h"
#include "cmark-gfm.h"
#include "cmark-gfm-core-extensions.h"
#include <cstdlib>

namespace cmark {

static const char *gfmExtensions[] = {
    "table",
    "strikethrough",
    "autolink",
    "tagfilter",
    "tasklist"
};

QByteArray markdown_to_html(const QByteArray &data)
{
    cmark_gfm_core_extensions_ensure_registered();

    const int options = CMARK_OPT_UNSAFE | CMARK_OPT_FOOTNOTES | CMARK_OPT_GITHUB_PRE_LANG;
    cmark_parser *parser = cmark_parser_new(options);
    for (const char *name : gfmExtensions) {
        cmark_syntax_extension *ext = cmark_find_syntax_extension(name);
        if (ext) {
            cmark_parser_attach_syntax_extension(parser, ext);
        }
    }

    cmark_parser_feed(parser, data.constData(), size_t(data.size()));
    cmark_node *doc = cmark_parser_finish(parser);
    char *buf = cmark_render_html(doc, options, cmark_parser_get_syntax_extensions(parser));
    QByteArray out(buf);
    free(buf);
    cmark_parser_free(parser);
    cmark_node_free(doc);
    return out;
}

} //cmark
