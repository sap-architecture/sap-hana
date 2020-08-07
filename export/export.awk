BEGIN {
  regex_nohttp  = "[^!]\\[[^\\]]*\\]\\([^\\)]+#[^\\)]+\\)";
  regex_http    = "\\[[^\\]]*\\]\\(http[^\\)]+#[^\\)]+\\)";
  regex_httpsub = "\\([^#(]+#";
  regex_img     = "!\\[[^\\]]*\\]\\([^\\)]+\\)";
  regex_imgsub  = "\\((\\.\\./)*images";
}

{
  # fix links
  line_sub = $0;
  line_new = "";
  after = line_sub;
  while (match(line_sub, regex_nohttp)) {
    before = substr(line_sub,1,RSTART);
    pattern = substr(line_sub,RSTART+1,RLENGTH-1);
    after = substr(line_sub,RSTART+RLENGTH);
    if (pattern !~ regex_http) {
      sub(regex_httpsub, "(#", pattern);
    }
    line_new = line_new before pattern;
    line_sub = after;
  }
  line_new = line_new after;

  # fix images
  line_sub = line_new;
  line_new = "";
  after = line_sub;
  while (match(line_sub, regex_img)) {
    before = substr(line_sub,1,RSTART-1);
    pattern = substr(line_sub,RSTART,RLENGTH);
    after = substr(line_sub,RSTART+RLENGTH);
    sub(regex_imgsub, "(../images", pattern);
    line_new = line_new before pattern;
    line_sub = after;
  }
  line_new = line_new after;

  print line_new;
}
