lua <<EOF

require("micki")

EOF

iabbrev display_trait impl std::fmt::Display for YOURSTRUCT {<CR> fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {<CR> write!(f, "({}, {})", self.x, self.y)<CR>}<CR>}<CR>
iabbrev dockerfile_rustbuilder FROM rust:1.67.1 AS builder<CR><CR>#COPY Cargo.toml Cargo.toml<CR>#COPY src src<CR>#COPY sqlx-data.json sqlx-data.json<CR>COPY . .<CR><CR>#ENV SQLX_OFFLINE=true<CR>RUN cargo build --release<CR>#RUN cargo build<CR><CR>FROM debian:buster-slim<CR><CR>COPY --from=builder ./target/release/mybinary /flutlicht-anmeldung/server<CR>#COPY --from=builder ./target/debug/server /flutlicht-anmeldung/server<CR>#COPY images images<CR><CR>#ENV TRANSLATION_FILE=/flutlicht-anmeldung/translation.yaml<CR><CR>CMD ["/myserver/mybinary"]<CR>

" RUST
iabbrev tracing_subscribe tracing_subscriber::fmt::fmt()<CR>.with_env_filter(<CR>EnvFilter::try_from_default_env().unwrap_or_else(\|_\| EnvFilter::new("INFO")),<CR>.init();<CR>

set nofoldenable

" let &colorcolumn="3," . join(range(10, 999, 5), ",") 
