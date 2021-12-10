SELECT 
  invoiceline_id,
  unit_price, 
  quantity,
  billing_state
  -- Specify the source table
FROM invoiceline
  -- Complete the join to the invoice table
left JOIN invoice
on invoiceline.invoice_id = invoice.invoice_id;

-- Avoid problems when different tables have the same column names
SELECT 
  album.album_id,
  title,
  album.artist_id,
  artist.name as artist
FROM album
INNER JOIN artist ON album.artist_id = artist.artist_id
-- Perform the correct join type to return matches or NULLS from the track table
right join track on album.album_id = track.album_id 
WHERE album.album_id IN (213,214)