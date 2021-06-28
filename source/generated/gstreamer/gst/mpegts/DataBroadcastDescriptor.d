module gst.mpegts.DataBroadcastDescriptor;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class DataBroadcastDescriptor
{
	/** the main Gtk struct */
	protected GstMpegtsDataBroadcastDescriptor* gstMpegtsDataBroadcastDescriptor;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDataBroadcastDescriptor* getDataBroadcastDescriptorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDataBroadcastDescriptor;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDataBroadcastDescriptor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDataBroadcastDescriptor* gstMpegtsDataBroadcastDescriptor, bool ownedRef = false)
	{
		this.gstMpegtsDataBroadcastDescriptor = gstMpegtsDataBroadcastDescriptor;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			gst_mpegts_dvb_data_broadcast_descriptor_free(gstMpegtsDataBroadcastDescriptor);
	}


	/**
	 * the data broadcast id
	 */
	public @property ushort dataBroadcastId()
	{
		return gstMpegtsDataBroadcastDescriptor.dataBroadcastId;
	}

	/** Ditto */
	public @property void dataBroadcastId(ushort value)
	{
		gstMpegtsDataBroadcastDescriptor.dataBroadcastId = value;
	}

	/**
	 * the component tag
	 */
	public @property ubyte componentTag()
	{
		return gstMpegtsDataBroadcastDescriptor.componentTag;
	}

	/** Ditto */
	public @property void componentTag(ubyte value)
	{
		gstMpegtsDataBroadcastDescriptor.componentTag = value;
	}


	/**
	 * the selector byte field
	 */
	public @property ubyte[] selectorBytes()
	{
		return gstMpegtsDataBroadcastDescriptor.selectorBytes[0..gstMpegtsDataBroadcastDescriptor.length];
	}

	/** Ditto */
	public @property void selectorBytes(ubyte[] value)
	{
		gstMpegtsDataBroadcastDescriptor.selectorBytes = value.ptr;
		gstMpegtsDataBroadcastDescriptor.length = cast(ubyte)value.length;
	}

	/**
	 * language of @text
	 */
	public @property string languageCode()
	{
		return Str.toString(gstMpegtsDataBroadcastDescriptor.languageCode);
	}

	/** Ditto */
	public @property void languageCode(string value)
	{
		gstMpegtsDataBroadcastDescriptor.languageCode = Str.toStringz(value);
	}

	/**
	 * description of data broadcast
	 */
	public @property string text()
	{
		return Str.toString(gstMpegtsDataBroadcastDescriptor.text);
	}

	/** Ditto */
	public @property void text(string value)
	{
		gstMpegtsDataBroadcastDescriptor.text = Str.toStringz(value);
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_data_broadcast_descriptor_get_type();
	}

	/** */
	public void free()
	{
		gst_mpegts_dvb_data_broadcast_descriptor_free(gstMpegtsDataBroadcastDescriptor);
		ownedRef = false;
	}
}
