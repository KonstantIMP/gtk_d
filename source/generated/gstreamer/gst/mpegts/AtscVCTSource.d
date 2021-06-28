module gst.mpegts.AtscVCTSource;

private import glib.MemorySlice;
private import glib.PtrArray;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Source from a @GstMpegtsAtscVCT, can be used both for TVCT and CVCT tables
 */
public final class AtscVCTSource
{
	/** the main Gtk struct */
	protected GstMpegtsAtscVCTSource* gstMpegtsAtscVCTSource;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsAtscVCTSource* getAtscVCTSourceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsAtscVCTSource;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsAtscVCTSource;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsAtscVCTSource* gstMpegtsAtscVCTSource, bool ownedRef = false)
	{
		this.gstMpegtsAtscVCTSource = gstMpegtsAtscVCTSource;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsAtscVCTSource);
	}


	/**
	 * The short name of a source
	 */
	public @property string shortName()
	{
		return Str.toString(gstMpegtsAtscVCTSource.shortName);
	}

	/** Ditto */
	public @property void shortName(string value)
	{
		gstMpegtsAtscVCTSource.shortName = Str.toStringz(value);
	}

	/**
	 * The major channel number
	 */
	public @property ushort majorChannelNumber()
	{
		return gstMpegtsAtscVCTSource.majorChannelNumber;
	}

	/** Ditto */
	public @property void majorChannelNumber(ushort value)
	{
		gstMpegtsAtscVCTSource.majorChannelNumber = value;
	}

	/**
	 * The minor channel number
	 */
	public @property ushort minorChannelNumber()
	{
		return gstMpegtsAtscVCTSource.minorChannelNumber;
	}

	/** Ditto */
	public @property void minorChannelNumber(ushort value)
	{
		gstMpegtsAtscVCTSource.minorChannelNumber = value;
	}

	/**
	 * The modulation mode
	 */
	public @property ubyte modulationMode()
	{
		return gstMpegtsAtscVCTSource.modulationMode;
	}

	/** Ditto */
	public @property void modulationMode(ubyte value)
	{
		gstMpegtsAtscVCTSource.modulationMode = value;
	}

	/**
	 * The carrier frequency
	 */
	public @property uint carrierFrequency()
	{
		return gstMpegtsAtscVCTSource.carrierFrequency;
	}

	/** Ditto */
	public @property void carrierFrequency(uint value)
	{
		gstMpegtsAtscVCTSource.carrierFrequency = value;
	}

	/**
	 * The transport stream ID
	 */
	public @property ushort channelTSID()
	{
		return gstMpegtsAtscVCTSource.channelTSID;
	}

	/** Ditto */
	public @property void channelTSID(ushort value)
	{
		gstMpegtsAtscVCTSource.channelTSID = value;
	}

	/**
	 * The program number (see #GstMpegtsPatProgram)
	 */
	public @property ushort programNumber()
	{
		return gstMpegtsAtscVCTSource.programNumber;
	}

	/** Ditto */
	public @property void programNumber(ushort value)
	{
		gstMpegtsAtscVCTSource.programNumber = value;
	}

	/**
	 * The ETM location
	 */
	public @property ubyte ETMLocation()
	{
		return gstMpegtsAtscVCTSource.ETMLocation;
	}

	/** Ditto */
	public @property void ETMLocation(ubyte value)
	{
		gstMpegtsAtscVCTSource.ETMLocation = value;
	}

	/**
	 * is access controlled
	 */
	public @property bool accessControlled()
	{
		return gstMpegtsAtscVCTSource.accessControlled != 0;
	}

	/** Ditto */
	public @property void accessControlled(bool value)
	{
		gstMpegtsAtscVCTSource.accessControlled = value;
	}

	/**
	 * is hidden
	 */
	public @property bool hidden()
	{
		return gstMpegtsAtscVCTSource.hidden != 0;
	}

	/** Ditto */
	public @property void hidden(bool value)
	{
		gstMpegtsAtscVCTSource.hidden = value;
	}

	/**
	 * is path select, CVCT only
	 */
	public @property bool pathSelect()
	{
		return gstMpegtsAtscVCTSource.pathSelect != 0;
	}

	/** Ditto */
	public @property void pathSelect(bool value)
	{
		gstMpegtsAtscVCTSource.pathSelect = value;
	}

	/**
	 * is out of band, CVCT only
	 */
	public @property bool outOfBand()
	{
		return gstMpegtsAtscVCTSource.outOfBand != 0;
	}

	/** Ditto */
	public @property void outOfBand(bool value)
	{
		gstMpegtsAtscVCTSource.outOfBand = value;
	}

	/**
	 * is hide guide
	 */
	public @property bool hideGuide()
	{
		return gstMpegtsAtscVCTSource.hideGuide != 0;
	}

	/** Ditto */
	public @property void hideGuide(bool value)
	{
		gstMpegtsAtscVCTSource.hideGuide = value;
	}

	/**
	 * The service type
	 */
	public @property ubyte serviceType()
	{
		return gstMpegtsAtscVCTSource.serviceType;
	}

	/** Ditto */
	public @property void serviceType(ubyte value)
	{
		gstMpegtsAtscVCTSource.serviceType = value;
	}

	/**
	 * The source id
	 */
	public @property ushort sourceId()
	{
		return gstMpegtsAtscVCTSource.sourceId;
	}

	/** Ditto */
	public @property void sourceId(ushort value)
	{
		gstMpegtsAtscVCTSource.sourceId = value;
	}

	/**
	 * an array of #GstMpegtsDescriptor
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsAtscVCTSource.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsAtscVCTSource.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_atsc_vct_source_get_type();
	}
}
