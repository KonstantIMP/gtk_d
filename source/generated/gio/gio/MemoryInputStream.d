module gio.MemoryInputStream;

private import gio.InputStream;
private import gio.PollableInputStreamIF;
private import gio.PollableInputStreamT;
private import gio.SeekableIF;
private import gio.SeekableT;
private import gio.c.functions;
public  import gio.c.types;
private import glib.Bytes;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * #GMemoryInputStream is a class for using arbitrary
 * memory chunks as input for GIO streaming input operations.
 * 
 * As of GLib 2.34, #GMemoryInputStream implements
 * #GPollableInputStream.
 */
public class MemoryInputStream : InputStream, PollableInputStreamIF, SeekableIF
{
	/** the main Gtk struct */
	protected GMemoryInputStream* gMemoryInputStream;

	/** Get the main Gtk struct */
	public GMemoryInputStream* getMemoryInputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gMemoryInputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gMemoryInputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GMemoryInputStream* gMemoryInputStream, bool ownedRef = false)
	{
		this.gMemoryInputStream = gMemoryInputStream;
		super(cast(GInputStream*)gMemoryInputStream, ownedRef);
	}

	// add the PollableInputStream capabilities
	mixin PollableInputStreamT!(GMemoryInputStream);

	// add the Seekable capabilities
	mixin SeekableT!(GMemoryInputStream);


	/** */
	public static GType getType()
	{
		return g_memory_input_stream_get_type();
	}

	/**
	 * Creates a new empty #GMemoryInputStream.
	 *
	 * Returns: a new #GInputStream
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = g_memory_input_stream_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GMemoryInputStream*) __p, true);
	}

	/**
	 * Creates a new #GMemoryInputStream with data from the given @bytes.
	 *
	 * Params:
	 *     bytes = a #GBytes
	 *
	 * Returns: new #GInputStream read from @bytes
	 *
	 * Since: 2.34
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Bytes bytes)
	{
		auto __p = g_memory_input_stream_new_from_bytes((bytes is null) ? null : bytes.getBytesStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_bytes");
		}

		this(cast(GMemoryInputStream*) __p, true);
	}

	/**
	 * Creates a new #GMemoryInputStream with data in memory of a given size.
	 *
	 * Params:
	 *     data = input data
	 *     destroy = function that is called to free @data, or %NULL
	 *
	 * Returns: new #GInputStream read from @data of @len bytes.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ubyte[] data, GDestroyNotify destroy)
	{
		auto __p = g_memory_input_stream_new_from_data(data.ptr, cast(ptrdiff_t)data.length, destroy);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_data");
		}

		this(cast(GMemoryInputStream*) __p, true);
	}

	/**
	 * Appends @bytes to data that can be read from the input stream.
	 *
	 * Params:
	 *     bytes = input data
	 *
	 * Since: 2.34
	 */
	public void addBytes(Bytes bytes)
	{
		g_memory_input_stream_add_bytes(gMemoryInputStream, (bytes is null) ? null : bytes.getBytesStruct());
	}

	/**
	 * Appends @data to data that can be read from the input stream
	 *
	 * Params:
	 *     data = input data
	 *     destroy = function that is called to free @data, or %NULL
	 */
	public void addData(ubyte[] data, GDestroyNotify destroy)
	{
		g_memory_input_stream_add_data(gMemoryInputStream, data.ptr, cast(ptrdiff_t)data.length, destroy);
	}
}
