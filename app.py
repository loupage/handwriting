import streamlit as st
from PIL import Image
import anthropic

client = anthropic.Anthropic()

st.title("🖋️ Handwriting Analyzer")
uploaded_file = st.file_uploader("Choose an image of handwriting or a signature", type = ["png", "jpg", "jpeg"])

if uploaded_file is not None:
    image = Image.open(uploaded_file)
    st.image(image, caption = "Uploaded Image", use_column_width = True)

    if st.button("Analyze Handwriting"):
        with st.spinner("Analyzing..."):
            # analysis = analyze_handwriting(image)
            st.subheader("Analysis Results:")
            st.write("v2")