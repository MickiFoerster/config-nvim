lua <<EOF

require("micki")

EOF

iabbrev display_trait impl std::fmt::Display for YOURSTRUCT {<CR> fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {<CR> write!(f, "({}, {})", self.x, self.y)<CR>}<CR>}<CR>
iabbrev dockerfile_rustbuilder FROM rust:1.67.1 AS builder<CR><CR>#COPY Cargo.toml Cargo.toml<CR>#COPY src src<CR>#COPY sqlx-data.json sqlx-data.json<CR>COPY . .<CR><CR>#ENV SQLX_OFFLINE=true<CR>RUN cargo build --release<CR>#RUN cargo build<CR><CR>FROM debian:buster-slim<CR><CR>COPY --from=builder ./target/release/mybinary /flutlicht-anmeldung/server<CR>#COPY --from=builder ./target/debug/server /flutlicht-anmeldung/server<CR>#COPY images images<CR><CR>#ENV TRANSLATION_FILE=/flutlicht-anmeldung/translation.yaml<CR><CR>CMD ["/myserver/mybinary"]<CR>

" RUST
iabbrev rust_tracing_subscribe tracing_subscriber::fmt::fmt()<CR>            .with_env_filter(<CR>                tracing_subscriber::EnvFilter::try_from_default_env()<CR>                    .unwrap_or_else(|_| tracing_subscriber::EnvFilter::new("INFO")),<CR>            )<CR>            .init();<CR>

set nofoldenable

" let &colorcolumn="3," . join(range(10, 999, 5), ",") 

" toggle git blame info with :GitBlameToggle
" let g:gitblame_enabled = 0

iabbrev rust_cli_std use std::env;<CR><CR>fn main() {<CR>let args: Vec<String> = env::args().collect();<CR><CR>let mut verbose = false;<CR>let mut jobs = None;<CR>let mut name = String::from("myname");<CR><CR><CR>for i in 1..args.len() {<CR>match args[i].as_str() {<CR>"-v" => verbose = true,<CR>"--jobs" => {<CR>    if let Some(value) = args.get(i + 1) {<CR>        if let Ok(num) = value.parse::<u32>() {<CR>            jobs = Some(num);<CR>        }<CR>    }<CR>}<CR>"--name" => {<CR>    if let Some(value) = args.get(i + 1) {<CR>        name = value.clone();<CR>    }<CR>}<CR>_ => {}<CR>}<CR>}<CR><CR><CR>println!("Verbose: {}", verbose);<CR>if let Some(jobs) = jobs {<CR>println!("Jobs: {}", jobs);<CR>}<CR>println!("Name: {}", name);<CR>}<CR><CR>
iabbrev rust_cli_clap use clap::{App, Arg};<CR><CR>fn main() {<CR>let matches = App::new("My Program")<CR>.arg(<CR>Arg::with_name("verbose")<CR>.short("v")<CR>.long("verbose")<CR>.help("Enable verbosity"),<CR>)<CR>.arg(<CR>Arg::with_name("jobs")<CR>.short("j")<CR>.long("jobs")<CR>.value_name("NUM")<CR>.help("Number of jobs")<CR>.takes_value(true),<CR>)<CR>.arg(<CR>Arg::with_name("name")<CR>.short("n")<CR>.long("name")<CR>.value_name("NAME")<CR>.help("Name argument")<CR>.takes_value(true)<CR>.default_value("myname"),<CR>)<CR>.get_matches();<CR><CR>let verbose = matches.is_present("verbose");<CR>let jobs = matches.value_of("jobs").map(\|v\| v.parse::<u32>().unwrap());<CR>let name = matches.value_of("name").unwrap();<CR><CR>println!("Verbose: {}", verbose);<CR>if let Some(jobs) = jobs {<CR>println!("Jobs: {}", jobs);<CR>}<CR>println!("Name: {}", name);<CR>}<CR><CR>
iabbrev go_cli_std package main<CR><CR>import (<CR>"flag"<CR>"fmt"<CR>)<CR><CR>func main() {<CR>verbose := flag.Bool("verbose", false, "Enable verbose mode")<CR>jobs := flag.Int("jobs", 0, "Number of jobs")<CR>name := flag.String("name", "myname", "Name")<CR><CR>flag.Parse()<CR><CR>fmt.Println("Verbose:", *verbose)<CR>fmt.Println("Jobs:", *jobs)<CR>fmt.Println("Name:", *name)<CR>}<CR><CR>
iabbrev go_cli_pflag package main<CR><CR>import (<CR>"fmt"<CR>"github.com/spf13/pflag"<CR>)<CR><CR>func main() {<CR>verbose := pflag.BoolP("verbose", "v", false, "Enable verbose mode")<CR>jobs := pflag.IntP("jobs", "j", 0, "Number of jobs")<CR>name := pflag.StringP("name", "n", "myname", "Name")<CR><CR>pflag.Parse()<CR><CR>fmt.Println("Verbose:", *verbose)<CR>fmt.Println("Jobs:", *jobs)<CR>fmt.Println("Name:", *name)<CR>}<CR><CR>
iabbrev go_curl package main<CR><CR>import (<CR>"encoding/json"<CR>"fmt"<CR>"io"<CR>"log"<CR>"net/http"<CR>"strings"<CR>)<CR><CR>func pretty_print_json(data []byte) {<CR>var json_data map[string]interface{}<CR><CR>err := json.Unmarshal(data, &json_data)<CR>if err != nil {<CR>log.Fatalf("parsing body as JSON failed: %s", err)<CR>}<CR><CR>fmt.Println(json_data["origin"])<CR>if sub_obj, ok := json_data["headers"].(map[string]interface{}); ok {<CR>fmt.Println(sub_obj["User-Agent"])<CR>} else {<CR>log.Fatalln("could not read JSON sub object")<CR>}<CR><CR>formatted_data, err := json.MarshalIndent(json_data, "", " ")<CR>if err != nil {<CR>log.Fatalf("failed to transform JSON into formatted string: %s", err)<CR>}<CR>fmt.Println(string(formatted_data))<CR>}<CR><CR>func main() {<CR>client := &http.Client{}<CR><CR>fmt.Printf("Now we do a GET request ...\n")<CR>req, err := http.NewRequest("GET", "https://httpbin.org/get", nil)<CR>if err != nil {<CR>log.Fatalf("creating GET request failed: %s", err)<CR>}<CR><CR>req.Header.Set("accept", "application/json")<CR><CR>resp, err := client.Do(req)<CR>if err != nil {<CR>log.Fatalf("GET request failed: %s", err)<CR>}<CR>defer resp.Body.Close()<CR><CR>body, err := io.ReadAll(resp.Body)<CR>if err != nil {<CR>log.Fatalf("reading response body failed: %s", err)<CR>}<CR><CR>pretty_print_json(body)<CR><CR>fmt.Println("========================================================\n\n")<CR>type Response struct {<CR>Origin  string `json:"origin"`<CR>Url     string `json:"url"`<CR>Headers struct {<CR>Useragent string `json:"User-Agent"`<CR>} `json:"headers"`<CR>}<CR><CR>var response Response<CR>err = json.Unmarshal(body, &response)<CR>if err != nil {<CR>log.Fatal(err)<CR>}<CR>fmt.Println(response)<CR><CR>fmt.Println("========================================================\n\n")<CR><CR>fmt.Printf("Now we do a POST request ...\n")<CR>var post_data = strings.NewReader(`{"amount": "10.00", "description": "test"}`)<CR>req, err = http.NewRequest("POST", "https://httpbin.org/post", post_data)<CR>if err != nil {<CR>log.Fatalf("creating GET request failed: %s", err)<CR>}<CR><CR>req.Header.Set("accept", "application/json")<CR>req.SetBasicAuth("USER", "password")<CR><CR>resp, err = client.Do(req)<CR>if err != nil {<CR>log.Fatalf("GET request failed: %s", err)<CR>}<CR>defer resp.Body.Close()<CR><CR>body, err = io.ReadAll(resp.Body)<CR>if err != nil {<CR>log.Fatalf("reading response body failed: %s", err)<CR>}<CR><CR>pretty_print_json(body)<CR><CR>}<CR><CR>
iabbrev rust_curl extern crate reqwest;<CR>use reqwest::header;<CR><CR>fn main() -> Result<(), Box<dyn std::error::Error>> {<CR>let mut headers = header::HeaderMap::new();<CR>headers.insert("Content-Type", "application/json".parse().unwrap());<CR><CR>let client = reqwest::blocking::Client::builder()<CR>.redirect(reqwest::redirect::Policy::none())<CR>.build()<CR>.unwrap();<CR>let res = client.post("https://example.com/v1/post-endpoint")<CR>.basic_auth("USER", Some("password"))<CR>.headers(headers)<CR>.body(r#"<CR><CR>{<CR>"amount": "10.00",<CR>"description": "test",<CR>}<CR>"#<CR>)<CR>.send()?<CR>.text()?;<CR>println!("{}", res);<CR><CR>Ok(())<CR>}<CR><CR>
iabbrev rust_axum use axum::{response::Html, routing::get, Router};<CR><CR>#[tokio::main]<CR>async fn main() {<CR>    let app = Router::new().route("/", get(handler));<CR><CR>    axum::Server::bind(&([127, 0, 0, 1], 3000).into())<CR>        .serve(app.into_make_service())<CR>        .await<CR>        .unwrap();<CR>}<CR><CR>async fn handler() -> Html<&'static str> {<CR>    Html("<html><body><h1>Healthcheck successful</h1></body></html>")<CR>}<CR><CR>
