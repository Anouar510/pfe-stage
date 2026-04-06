<form id="chatForm">
    <input type="text" id="message" placeholder="Ask me anything..." />
    <button type="submit">Send</button>
</form>
<div id="response"></div>

<script>
document.getElementById('chatForm').addEventListener('submit', async function(e){
    e.preventDefault();
    const message = document.getElementById('message').value;

    const res = await fetch('/chat', {
        method: 'POST',
        headers: {'Content-Type':'application/json'},
        body: JSON.stringify({message})
    });

    const data = await res.json();
    document.getElementById('response').innerText = data.answer || JSON.stringify(data);
});
</script>