from scholarly import scholarly


def get_citation_count_and_hindex(user_id: str):
    author = scholarly.search_author_id(user_id)
    author_filled = scholarly.fill(author, sections=['basics'])
    citations = author_filled.get('citedby', 0)
    hindex = author_filled.get('hindex', 0)
    return citations, hindex

if __name__ == "__main__":
    profile_id = "jNBoowwAAAAJ"
    cites, hindex = get_citation_count_and_hindex(profile_id)
    with open("files/CV/citations.tex", "w") as f:
        f.write(f"\\newcommand{{\\citations}}{{{cites}}}\n")
        f.write(f"\\newcommand{{\\hindex}}{{{hindex}}}\n")
