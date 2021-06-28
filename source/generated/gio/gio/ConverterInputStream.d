module gio.ConverterInputStream;

private import gio.ConverterIF;
private import gio.FilterInputStream;
private import gio.InputStream;
private import gio.PollableInputStreamIF;
private import gio.PollableInputStreamT;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * Converter input stream implements #GInputStream and allows
 * conversion of data of various types during reading.
 * 
 * As of GLib 2.34, #GConverterInputStream implements
 * #GPollableInputStream.
 */
public class ConverterInputStream : FilterInputStream, PollableInputStreamIF
{
	/** the main Gtk struct */
	protected GConverterInputStream* gConverterInputStream;

	/** Get the main Gtk struct */
	public GConverterInputStream* getConverterInputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gConverterInputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gConverterInputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GConverterInputStream* gConverterInputStream, bool ownedRef = false)
	{
		this.gConverterInputStream = gConverterInputStream;
		super(cast(GFilterInputStream*)gConverterInputStream, ownedRef);
	}

	// add the PollableInputStream capabilities
	mixin PollableInputStreamT!(GConverterInputStream);


	/** */
	public static GType getType()
	{
		return g_converter_input_stream_get_type();
	}

	/**
	 * Creates a new converter input stream for the @base_stream.
	 *
	 * Params:
	 *     baseStream = a #GInputStream
	 *     converter = a #GConverter
	 *
	 * Returns: a new #GInputStream.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(InputStream baseStream, ConverterIF converter)
	{
		auto __p = g_converter_input_stream_new((baseStream is null) ? null : baseStream.getInputStreamStruct(), (converter is null) ? null : converter.getConverterStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GConverterInputStream*) __p, true);
	}

	/**
	 * Gets the #GConverter that is used by @converter_stream.
	 *
	 * Returns: the converter of the converter input stream
	 *
	 * Since: 2.24
	 */
	public ConverterIF getConverter()
	{
		auto __p = g_converter_input_stream_get_converter(gConverterInputStream);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ConverterIF)(cast(GConverter*) __p);
	}
}
